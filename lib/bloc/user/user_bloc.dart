import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/models/user.dart';
import 'package:matchgame/repository/auth_repository.dart';

part 'package:matchgame/bloc/user/user_event.dart';
part 'package:matchgame/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository _repository;
  UserBloc(this._repository): super(LoadUserState()){

    on<LoadingUserEvent>((event, emit) async {
      final user = await _repository.keepLogin();
      if(user != null) {
        emit(InAuthUserState(user));
      } else {
        emit(UnAuthUserState());
      }

    });

    on<SignInEvent>((event, emit) async {
      final user = await _repository.signIn(event.user, event.password);
      if(user != null) {
        emit(InAuthUserState(user));
      } else {
        emit(UnAuthUserState());
      }
    });

    on<SignUpEvent>((event, emit) async {
      await _repository.signUp(event.user);
      emit(UnAuthUserState());
    });

    on<SignOutEvent>((event, emit) async {
      await _repository.signOut();
      emit(UnAuthUserState());
    });
  }
}
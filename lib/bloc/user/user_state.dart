part of 'user_bloc.dart';

abstract class UserState extends Equatable{}

class UnAuthUserState extends UserState {
  @override
  List<Object?> get props => [];

}

class LoadUserState extends UserState {
  @override
  List<Object?> get props => [];

}

class InAuthUserState extends UserState {
  final User user;

  InAuthUserState(this.user);

  @override
  List<Object?> get props => [user];
}
part of 'user_bloc.dart';

abstract class UserEvent {}

class SignInEvent extends UserEvent {
  final String user;
  final String password;

  SignInEvent(this.user, this.password);

}

class LoadingUserEvent extends UserEvent {

}

class SignOutEvent extends UserEvent {

}

class SignUpEvent extends UserEvent {
  final User user;

  SignUpEvent(this.user);
}
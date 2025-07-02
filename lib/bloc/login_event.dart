

abstract class LoginEvent {}

class LoginSendEvent extends LoginEvent {
  final String username, password;
  LoginSendEvent(this.username, this.password);
}

class LoginSuccessEvent extends LoginEvent {
  final String token;
  LoginSuccessEvent(this.token);
}

class LoginErrorEvent extends LoginEvent {}
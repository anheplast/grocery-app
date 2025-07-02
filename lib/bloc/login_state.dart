

class LoginState {
  final String token;
  final bool loading;
  final String? error;

  LoginState({this.token = '', this.loading = false, this.error});
}
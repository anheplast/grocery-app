
import 'package:bloc/bloc.dart';
import '../services/login.service.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSendEvent>((e, emit) async {
      emit(LoginState(loading: true));                  
      try {
        final token = await loginService(e.username, e.password);  
        emit(LoginState(token: token, loading: false)); 
      } catch (err) {
        emit(LoginState(error: err.toString()));        
      }
    });
  }
}

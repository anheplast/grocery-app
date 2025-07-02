import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import 'package:grocery_app/widgets/global_form_button.dart';
import 'package:grocery_app/widgets/global_form_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.token.isNotEmpty) {
              print('Inicio de sesión exitoso!');
              Navigator.pushReplacementNamed(context, '/home');
            }
            if (state.error != null) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GlobalFormText(
                  label: 'Usuario',
                  controller: usernameController,
                ),
                const SizedBox(height: 20),
                GlobalFormText(
                  label: 'Contraseña',
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state.loading) {
                      return const CircularProgressIndicator();
                    }
                    return GlobalFormButton(
                      label: 'Iniciar sesión',
                      onTap: () {
                        context.read<LoginBloc>().add(
                          LoginSendEvent(
                            usernameController.text,
                            passwordController.text,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
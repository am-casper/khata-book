import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khata_book/domain/repositories/user_repository.dart';
import 'package:khata_book/presentation/app/bloc/app_bloc.dart';
import 'package:khata_book/presentation/login/bloc/login_bloc.dart';

@RoutePage()
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController balanceController = TextEditingController();
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) =>
              LoginBloc(userRepository: context.read<UserRepository>()),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is LoginInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Login Screen'),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Phone number',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                            LoginButtonPressed(phone: phoneController.text));
                      },
                      child: const Text('Login'),
                    ),
                  ],
                );
              } else if (state is SignUpScreenActive) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sign Up Screen'),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Name',
                      ),
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Phone number',
                      ),
                    ),
                    TextField(
                      controller: balanceController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Current Balance in Rs.',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(SignUpButtonPressed(
                            phone: phoneController.text,
                            name: nameController.text,
                            balance: double.parse(balanceController.text)));
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                );
              } else if (state is LoginSuccess) {
                context.read<AppBloc>().add(const NavigateToHomeScreen());
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/user/user_bloc.dart';
import 'package:matchgame/models/user.dart';

class RegisterScreen extends StatelessWidget {
  static const route = 'sign_up';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const RegisterForm(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You already have an account'),
              TextButton(onPressed: () => AppNavigator().pop(), child: const Text('Sign in'))
            ],
          )
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _key = GlobalKey<FormState>();
  final controllers = <String, TextEditingController>{};
  @override
  void initState() {
    controllers['name'] = TextEditingController(text: '');
    controllers['user'] = TextEditingController(text: '');
    controllers['password'] = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controllers['name'],
                decoration: InputDecoration(
                  label: const Text('Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.tealAccent.shade400,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllers['user'],
                decoration: InputDecoration(
                  label: const Text('User'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.tealAccent.shade400,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllers['password'],
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.tealAccent.shade400,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final validForm = _key.currentState?.validate();
                        if (validForm ?? false) {
                          context.read<UserBloc>().add(
                              SignUpEvent(User(id: User.generateId, name: controllers['name']!.text, userName: controllers['user']!.text, password: controllers['password']!.text, results: []))
                          );
                          AppNavigator().pop();
                        }
                      },
                      child: const Text('Register'))
                ],
              )
            ],
          ),
        ));
  }
}

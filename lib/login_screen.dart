import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/home_screen.dart';
import 'package:untitled1/login/login_provider.dart';
import 'package:untitled1/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    loginProvider = LoginProvider()
      ..addListener(() {
        final state = loginProvider.currentState;
        if (state is LoginStateLoaded) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    super.initState();
  }

  late LoginProvider loginProvider;
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
        value: loginProvider,
        child: Scaffold(
          appBar: AppBar(title: const Text('Login Screen')),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 20,
                  ),
                  Selector<LoginProvider, LoginState>(
                      selector:
                          (BuildContext context, LoginProvider provider) =>
                              loginProvider.currentState,
                      builder: (context, LoginState state, Widget? child) {
                        return ElevatedButton(
                            onPressed: () {
                              loginProvider.generateToken(
                                  _usernameController.text.trim(),
                                  _passwordController.text.trim());
                            },
                            child: state is LoginStateLoading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('Login'));
                      })
                ],
              ),
            ),
          ),
        ));
  }
}

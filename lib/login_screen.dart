import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ElevatedButton(
                  onPressed: () {
           generateToken();
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

 Future<void> generateToken() async {
    try {
      final dio = Dio();
      final response = await dio
          .post('https://bookstore.demoqa.com/Account/v1/GenerateToken', data: {
        "userName": _usernameController.text.trim(),
        "password": _passwordController.text.trim()
      });
      print(response.toString());
    } catch (e) {
      print(e);
    }
  }
}
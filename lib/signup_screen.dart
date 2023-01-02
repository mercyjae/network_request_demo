

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup Screen')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    createAccount(
                       userName: usernameController.text.trim(),
                         password: passwordController.text.trim());
                  
                  },
                  child: const Text('Signup')),
                   const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Have an account already. '),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                },
                  child: const Text('Login instead',style: TextStyle(color: Colors.blue),))
              ],)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createAccount(
      {required String userName, required String password}) async {
    try {
      final dio = Dio();
      final response =
          await dio.post('https://bookstore.demoqa.com/Account/v1/User', data: {
        "userName": userName,
        "password": password,
      });
      
      print(response.toString());
    } catch (e, s) {
      print('$e $s');
    }
   
  }

  
}

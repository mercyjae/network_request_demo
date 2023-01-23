import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:untitled1/hive_service.dart';
import 'package:untitled1/login_screen.dart';
import 'package:untitled1/signup_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    print('ayo');
    setAndGetData();

    super.initState();
  }

  Future<void> setAndGetData() async{
    final  hiveService = HiveService();
    await hiveService.putData('username', key: 'name1',value: 'mercy');
    await hiveService.putData('username', key: 'name2',value: 'Joy');
    await hiveService.putData('username', key: 'name3',value: 'Arowolo');
    await hiveService.putData('email',key: 'myEmail',value: 'mercyjae@gmail.com');
    await hiveService.putData('dob', key: 'myDob',value: '20-12-2022');

    Future.delayed(Duration(seconds: 3),()async{
      final name1 = await hiveService.getData('username', key: 'name1',);
      final name2 = await hiveService.getData('username', key: 'name2',);
      final name3 = await hiveService.getData('username', key: 'name3',);
      final myEmail = await hiveService.getData('email', key: 'myEmail',);
      final myDob = await hiveService.getData('dob', key: 'myDob',);

      log(name1.toString());
      log(name2.toString());
      log(name3.toString());
      log(myEmail.toString());
      log(myDob.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
            }, child: Text('Signup Screen')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            }, child: Text('Login Screen'))
          ]),
    );
  }
}

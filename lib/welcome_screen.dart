import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:untitled1/hive_service.dart';


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
    await hiveService.putData('username', key: 'username1',value: 'mercy');
    await hiveService.putData('username', key: 'username2',value: 'Joy');
    await hiveService.putData('username', key: 'username3',value: ' Arowolo');

    Future.delayed(Duration(seconds: 3),()async{
      final username1 = await hiveService.getData('username', key: 'username1');
      log(username1.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
            }, child: Text('Signup Screen')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            }, child: Text('Login Screen'))
          ]),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled1/signup_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDoc = await getApplicationDocumentsDirectory();
  Hive.init(appDoc.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen()
    );
  }
}


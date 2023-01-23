import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled1/hive_service.dart';
import 'package:untitled1/welcome_screen.dart';
import 'package:untitled1/welcome_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // String appDocPath = appDocDir.path;
  // await Hive.initFlutter(appDocPath);
  await initHive();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen()
    );
  }
}


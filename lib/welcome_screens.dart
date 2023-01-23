import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:untitled1/hive_services.dart';


class WelcomeSCreen extends StatefulWidget {
  const WelcomeSCreen({super.key});

  @override
  State<WelcomeSCreen> createState() => _WelcomeSCreenState();
}

class _WelcomeSCreenState extends State<WelcomeSCreen> {
  @override
  void initState() {
    super.initState();
    log('ayo');
    setAndGetData();
  }

  Future<void> setAndGetData() async {
    final hiveService = HiveServices();
    await hiveService.storeData(
      boxName: 'user',
      data: {
        'name': 'czar',
        'title': 'bro',
      },
    );
    Future.delayed(const Duration(seconds: 3), () async {
      final fetchedData = await hiveService.getData(
        'user',
        ['name', 'title'],
      );
      log(fetchedData.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => const LoginScreen(),
                //   ),
                // );
              },
              child: const Text(
                'Login',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => const CreateAccountScreen(),
                //   ),
                // );
              },
              child: const Text(
                'Create Account',
              ),
            )
          ],
        ),
      ),
    );
  }
}

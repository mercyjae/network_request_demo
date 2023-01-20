import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NetWorkService {
 static Future<void> useHive(
      {required String userName, required String password}) async {
    var box = await Hive.openBox('credentials');
    box.putAll({'userName': userName, 'password': password});
    print('Saving::: userName: $userName , password: $password.');
    
    await Future.delayed(const Duration(seconds: 4));

    String getuserName = box.get('userName');

    String getPassword = box.get('password');

    print('getting::: userName $userName , password: $password');
  }


final  dio = Dio();
    static Future<void> createAccount(
      {required String userName, required String password}) async {
            useHive(userName: userName, password: password);


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


//Arowolo
//$Arowolo20.
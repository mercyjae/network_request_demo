import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
Future<void> initHive() async {
  // Directory appDoc = await getApplicationDocumentsDirectory();
  // Hive.init(appDoc.path);
  final appDocumentDirectory =
  await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  await HiveService.openBox('username');
  await HiveService.openBox('email');
  await HiveService.openBox('dob');
}
class HiveService {


  static Future<Box<dynamic>> openBox(String value) async {
    return Hive.openBox(value);
  }

  static Future<void> registerAdapter<T>(
      TypeAdapter<T> adapter, {
        bool internal = false,
        bool override = false,
      }) async {
    return  Hive.registerAdapter(adapter,
        internal: internal, override: override);
  }

  Future putData(String boxName, {required String key, dynamic value}) {
    return Hive.box(boxName).put(key, value);
  }

  Future getData(String boxName, {required String key, dynamic defaultValue}) async{
    return await Hive.box(boxName).get(key, defaultValue: defaultValue);
  }

  Future deleteData(String boxName, {required String key}) {
    return Hive.box(boxName).delete(key);
  }

  Future deleteDatas(String boxName, {required List<String> keys}) {
    return Hive.box(boxName).delete(keys);
  }

  Future eraseHiveDB() {
    return Hive.deleteFromDisk();
  }
}

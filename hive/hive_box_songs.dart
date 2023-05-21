import 'package:hive/hive.dart';
import 'package:retrofitapi_flutter/hive/song.dart';

class HiveBox {
  static const String boxName = 'songs';

  static Future<Box<Song>> openBox() async {
    return await Hive.openBox<Song>(boxName);
  }
}

import 'package:hive/hive.dart';

class DatabaseRepository {
  static late BoxCollection collection;

  static Future<void> initDatabase() async {
    collection = await BoxCollection.open(
      'collection',
      {'players'},
      path: './',
    );
  }
}

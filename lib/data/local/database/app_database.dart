import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../dao/product_dao.dart';
import '../entities/product_entity.dart';

part 'app_database.g.dart'; // generated file

@Database(version: 1, entities: [ProductEntity])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}

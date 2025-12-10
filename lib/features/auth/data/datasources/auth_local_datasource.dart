import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/local/hive_boxes.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getLastUser();
  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;

  AuthLocalDataSourceImpl({Box? box}) 
      : box = box ?? Hive.box(HiveBoxes.authBox);

  @override
  Future<void> cacheUser(UserModel user) async {
    await box.put('cached_user', jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel> getLastUser() async {
    final jsonString = box.get('cached_user');
    if (jsonString != null) {
      return UserModel.fromJson(jsonDecode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> clearCache() async {
    await box.delete('cached_user');
  }
}

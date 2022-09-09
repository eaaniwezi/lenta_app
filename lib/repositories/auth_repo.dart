// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:lenta_app/models/user.dart';
import 'package:lenta_app/models/tokens.dart';
import 'package:lenta_app/repositories/dio_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepo {
  var dioRequest = Dio();
  final storage = FlutterSecureStorage();

  Future<Tokens> loginUser(
      {required String email, required String password}) async {
    var tokens;
    try {
      var userData = {"email": email, "password": password};
      final tokens = await Api().api.post("/api/v1/auth/login", data: userData);
      return Tokens.fromJson(tokens.data['tokens']);
    } catch (e) {
      print(e);
      return tokens;
    }
  }

  Future<Tokens> registerUser({
    required String email,
    required String nickname,
    required String password,
    required String phone,
  }) async {
    var tokens;
    try {
      var userData = {
        "email": email,
        "nickname": nickname,
        "phone": phone,
        "password": password
      };
      final tokens = await Api()
          .api
          .post("/api/v1/auth/registration/customer/new", data: userData);
      return Tokens.fromJson(tokens.data['tokens']);
    } catch (e) {
      return tokens;
    }
  }

  Future<User> getUser() async {
    var currentUser;
    try {
      final currentUser = await Api().api.get('/api/v1/auth/login/profile');
      return User.fromJson(currentUser.data);
    } catch (e) {
      return currentUser;
    }
  }

  Future<bool> refreshToken() async {
    final token = await storage.read(key: "refreshToken");
    var userToken = {"refreshToken": token};
    dioRequest.options.baseUrl = "http://api.codeunion.kz";
    var response =
        await dioRequest.post("/api/v1/auth/login/refresh", data: userToken);

    if ((response.statusCode == 201) || (response.statusCode == 200)) {
      var newAccessToken = await response.data['tokens']['accessToken'];
      var newRefreshToken = await response.data['tokens']['refreshToken'];
      await persistTokens(
          accessToken: newAccessToken, refreshToken: newRefreshToken);
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistTokens(
      {required String accessToken, required String refreshToken}) async {
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'accessToken');
    storage.delete(key: 'refreshToken');
    storage.deleteAll();
  }

  Future<bool> hasToken() async {
    var accessToken = await storage.read(key: 'accessToken');
    var refreshToken = await storage.read(key: 'refreshToken');
    if ((accessToken != null) && (refreshToken != null)) {
      return true;
    } else {
      return false;
    }
  }
}

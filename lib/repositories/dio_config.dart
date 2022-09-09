// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetPackage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lenta_app/repositories/auth_repo.dart';
import 'package:lenta_app/screens/sign_in_screen.dart';

class Api {
  final Dio api = Dio();
  final _storage = const FlutterSecureStorage();

  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final accessToken = await _storage.read(key: "accessToken");
      if (!options.path.contains('http')) {
        options.path = 'http://api.codeunion.kz' + options.path;
      }
      print(accessToken);
      accessToken == null
          ? options.headers = {
              "Accept": "application/json",
              "Content-Type": 'application/json'
            }
          : options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      try {
        if ((error.response?.statusCode == 401 &&
            error.response?.data['message'] == "Unauthorized")) {
          if (await _storage.containsKey(key: 'refreshToken')) {
            if (await AuthRepo().refreshToken()) {
              return handler.resolve(await _retry(error.requestOptions));
            }
          }
        }
      } catch (e) {
        _storage.deleteAll();
        GetPackage.Get.offAll(() => SignInScreen());
      }

      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}

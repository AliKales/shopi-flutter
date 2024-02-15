import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shopi/core/extensions/ext_date_time.dart';
import 'package:shopi/core/h_hive.dart';
import 'package:shopi/env.dart';
import 'package:shopi/models/m_dio_result.dart';

import '../models/m_auth.dart';

final class Auth {
  const Auth._();

  static MAuth? auth;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "$BASE_URL/api",
      contentType: "application/json",
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  static Future<void> init() async {
    auth = HHive.getSettings(HiveSettings.auth);

    await refreshToken();
  }

  static bool get isLoggedIn => auth != null;

  ///[refreshToken] return true if token is usable
  static Future<bool> refreshToken() async {
    if (auth == null) return false;
    if (!auth!.tokenExpireAt.isExpired) return true;
    if (auth!.refreshTokenExpireAt.isExpired) {
      auth = null;
      _saveAuth();
      return false;
    }

    final result = await _dio.get(
      "/refresh-token",
      options: _optionsWithBearer(auth!.refreshToken),
    );

    if (result.statusCode == HttpStatus.ok) {
      auth = MAuth.fromJson(result.data);
      _saveAuth();
      return true;
    }

    return false;
  }

  static Future<MDioResult> login(String username, String password) async {
    final result = await _dio.post(
      "/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    if (result.statusCode == 200) {
      auth = MAuth.fromJson(result.data);
      _saveAuth();
    }

    return _getResult(result);
  }

  static MDioResult _getResult(Response response) {
    return MDioResult(
      status: response.statusCode ?? 0,
      data: response.data is Map ? response.data : {},
    );
  }

  static void _saveAuth() {
    HHive.putSettings(HiveSettings.auth, auth);
  }

  static Options _optionsWithBearer(String token) {
    return Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  }
}

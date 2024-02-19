import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shopi/core/extensions/ext_date_time.dart';
import 'package:shopi/core/h_hive.dart';
import 'package:shopi/models/m_dio_result.dart';
import 'package:shopi/router.dart';
import 'package:shopi/service/base_service.dart';

import '../models/m_auth.dart';
import '../models/m_me.dart';

final class Auth {
  const Auth._();

  static MAuth? auth;
  static MMe? me;

  static Dio get _dio => BaseService.dio;

  static Future<void> init() async {
    auth = HHive.getSettings(HiveSettings.auth);

    await refreshToken();
  }

  static bool get isLoggedIn => auth != null;

  ///[refreshToken] return true if token is usable
  static Future<bool> refreshToken([bool redirect = false]) async {
    if (auth == null) return false;
    if (!auth!.tokenExpireAt.isExpired) return true;
    if (auth!.refreshTokenExpireAt.isExpired) {
      _clearAuth();

      if (redirect) appRouter.go(PagePaths.login);
      return false;
    }

    return await _refreshTokenRequest();
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

    return _getResult(result, false);
  }

  static Future<MDioResult> getMe() async {
    final result =
        await _dio.get("/user", options: _optionsWithBearer(auth!.token));

    final dioResult = _getResult(result, false);

    if (dioResult.isOk) {
      me = MMe.fromJson(result.data["user"]);
    }

    return dioResult;
  }

  static Options get getOptionWithToken => _optionsWithBearer(auth!.token);

  static Future<void> logout() async {
    await _clearAuth();
    appRouter.go(PagePaths.login);
  }

  ///PRIVATE FUNCTIONS
  ///>>>>>>>>>>>>>>>>>

  static Future<void> _clearAuth() async {
    auth = null;
    await _saveAuth();
  }

  static Future<bool> _refreshTokenRequest() async {
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

  static MDioResult _getResult(Response response, bool checkAuth) {
    if (checkAuth && response.statusCode == HttpStatus.unauthorized) {
      _clearAuth();
      return MDioResult(status: HttpStatus.unauthorized, data: {});
    }

    return MDioResult(
      status: response.statusCode ?? 0,
      data: response.data is Map ? response.data : {},
    );
  }

  static Future<void> _saveAuth() async {
    await HHive.putSettings(HiveSettings.auth, auth);
  }

  static Options _optionsWithBearer(String token) {
    return Options(
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  }
}

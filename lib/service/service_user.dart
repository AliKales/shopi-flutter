import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/service/auth.dart';
import 'package:shopi/service/base_service.dart';

class ServiceUser {
  const ServiceUser._();

  static Dio get _dio => BaseService.dio;

  static Future<void> getCart() async {
    final result = await _dio.get("/cart", options: Auth.getOptionWithToken);
    log(result.data.toString());
  }
}

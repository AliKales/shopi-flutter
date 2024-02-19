import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/service/base_service.dart';

final class ServiceStore {
  const ServiceStore._();

  static Dio get _dio => BaseService.dio;

  static Future<void> getStore(String linkName) async {
    final result = await _dio.get("/store/$linkName");
    log(result.data.toString());
  }
}

import 'package:dio/dio.dart';
import 'package:shopi/env.dart';

final class BaseService {
  const BaseService._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "$BASE_URL/api",
      contentType: "application/json",
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
}

import 'package:dio/dio.dart';
import 'package:shopi/core/local_utils.dart';
import 'package:shopi/models/m_store.dart';
import 'package:shopi/service/base_service.dart';

final class ServiceStore {
  const ServiceStore._();

  static Dio get _dio => BaseService.dio;

  static Future<MStore?> getStore(String linkName) async {
    final result = await _dio.get("/store/$linkName");

    if (result.statusCode != 200) return null;

    return MStore.fromJson(LocalUtils.upperMapKeys(result.data["store"]));
  }

  static Future<List<MStore>?> getNewestStores() async {
    final result = await _dio.get("/newest-stores");

    if (result.statusCode != 200) return null;

    List stores = result.data["stores"];

    return stores.map((e) => MStore.fromJson(e)).toList();
  }
}

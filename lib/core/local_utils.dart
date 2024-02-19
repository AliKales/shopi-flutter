import 'package:caroby/caroby.dart';

final class LocalUtils {
  const LocalUtils._();

  static Map<String, dynamic> upperMapKeys(Map<String, dynamic> map) {
    Map<String, dynamic> newMap = {};

    for (var key in map.keys) {
      newMap[key.capitalize()] = map[key];
    }

    return newMap;
  }
}

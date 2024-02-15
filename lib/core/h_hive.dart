import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopi/models/m_auth.dart';

enum HiveBox {
  settings,
  passwords,
  pins,
}

enum HiveSettings {
  auth,
}

final class HHive {
  const HHive._();

  static late Box _settings;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MAuthAdapter());
    _settings = await Hive.openBox(HiveBox.settings.name);
  }

  static dynamic getSettings(HiveSettings settings) {
    return _settings.get(settings.name);
  }

  static Future<void> putSettings(HiveSettings settings, dynamic val) async {
    await _settings.put(settings.name, val);
  }
}

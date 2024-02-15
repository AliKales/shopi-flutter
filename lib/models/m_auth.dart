import 'package:hive_flutter/hive_flutter.dart';

part 'm_auth.g.dart';

@HiveType(typeId: 1)
class MAuth {
  @HiveField(0)
  String token;
  @HiveField(1)
  String refreshToken;
  @HiveField(2)
  DateTime tokenExpireAt;
  @HiveField(3)
  DateTime refreshTokenExpireAt;

  MAuth({
    required this.token,
    required this.refreshToken,
    required this.tokenExpireAt,
    required this.refreshTokenExpireAt,
  });

  factory MAuth.fromJson(Map<String, dynamic> json) {
    return MAuth(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenExpireAt: DateTime.parse(json['tokenExpireAt']).toLocal(),
      refreshTokenExpireAt:
          DateTime.parse(json['refreshTokenExpireAt']).toLocal(),
    );
  }
}

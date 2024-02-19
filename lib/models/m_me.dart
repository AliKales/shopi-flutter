class MMe {
  String? username;
  String? createdAt;
  int? id;
  String? email;
  bool? isEmailVerified;
  int? storeId;
  int? cartItemCount;

  MMe({
    this.username,
    this.createdAt,
    this.id,
    this.email,
    this.isEmailVerified,
    this.storeId,
    this.cartItemCount,
  });

  factory MMe.fromJson(Map<String, dynamic> json) {
    return MMe(
      username: json['username'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      storeId: json['storeId'] as int?,
      cartItemCount: json['cartItemCount'] as int?,
    );
  }

  @override
  String toString() =>
      "MMe(username: $username,createdAt: $createdAt,id: $id,email: $email,isEmailVerified: $isEmailVerified,storeId: $storeId,cartItemCount: $cartItemCount)";

  @override
  int get hashCode => Object.hash(
      username, createdAt, id, email, isEmailVerified, storeId, cartItemCount);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MMe &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          createdAt == other.createdAt &&
          id == other.id &&
          email == other.email &&
          isEmailVerified == other.isEmailVerified &&
          storeId == other.storeId &&
          cartItemCount == other.cartItemCount;
}

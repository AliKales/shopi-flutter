class MStore {
  int? id;
  int? userId;
  String? createdAt;
  String? name;
  String? linkName;
  int? itemCount;
  int? itemSellCount;

  MStore({
    this.id,
    this.userId,
    this.createdAt,
    this.name,
    this.linkName,
    this.itemCount,
    this.itemSellCount,
  });

  factory MStore.fromJson(Map<String, dynamic> json) {
    return MStore(
      id: json['Id'] as int?,
      userId: json['UserId'] as int?,
      createdAt: json['CreatedAt'] as String?,
      name: json['Name'] as String?,
      linkName: json['LinkName'] as String?,
      itemCount: json['ItemCount'] as int?,
      itemSellCount: json['ItemSellCount'] as int?,
    );
  }

  @override
  String toString() =>
      "MStore(id: $id,userId: $userId,createdAt: $createdAt,name: $name,linkName: $linkName,itemCount: $itemCount,itemSellCount: $itemSellCount)";

  @override
  int get hashCode => Object.hash(
      id, userId, createdAt, name, linkName, itemCount, itemSellCount);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MStore &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          createdAt == other.createdAt &&
          name == other.name &&
          linkName == other.linkName &&
          itemCount == other.itemCount &&
          itemSellCount == other.itemSellCount;
}

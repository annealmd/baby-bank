import 'dart:convert';

class OriginModel {
  int? id;
  String? name;
  OriginModel();
  OriginModel.create(
    this.id,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory OriginModel.fromMap(Map<String, dynamic> map) {
    return OriginModel.create(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginModel.fromJson(String source) =>
      OriginModel.fromMap(json.decode(source));

  @override
  String toString() => 'OriginModel(id: $id, name: $name)';
}

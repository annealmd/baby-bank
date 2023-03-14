import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  DateTime? dtBirth;
  DateTime? dtCreate;

  UserModel();

  UserModel.create(
    this.id,
    this.name,
    this.surname,
    this.email,
    this.password,
    this.dtBirth,
    this.dtCreate,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'dtBirth': dtBirth?.millisecondsSinceEpoch,
      'dtCreate': dtCreate?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel.create(
      map['id']?.toInt() ?? 0,
      map['name'],
      map['surname'],
      map['email'],
      map['password'],
      map['dtBirth'] != null ? DateTime.parse(map['dtBirth']) : null,
      map['dtCreate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dtCreate'])
          : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

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
      'dtBirth': dtBirth,
      'dtCrate': dtCreate,
    };
  }
}

import '../../domain/model/user_model.dart';
import '../../domain/port/output/repository.dart';
import 'db_configuration.dart';

class UserRepositoryIpml implements Repository<UserModel> {
  final DBConfiguration _dbCall;

  UserRepositoryIpml(this._dbCall);
  @override
  Future<bool> create(int? idUser, item) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int? idUser, int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> findAll(int? idUser) async {
    String sql = 'SELECT * FROM tb_user ORDER BY name';
    var result = await _dbCall.execQuery(sql);
    List<UserModel> list = [];
    for (var row in result) {
      print('id: ${row[0]} Name: ${row[1]}');
      list.add(
        UserModel.create(
          row[0],
          row[1],
          row[2],
          row[3],
          row[4],
          row[5],
          row[6],
        ),
      );
    }
    return list;
  }
}

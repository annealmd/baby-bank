import '../../domain/model/origin_model.dart';
import '../../domain/port/output/repository.dart';
import 'db_configuration.dart';

class OriginRepositoryIpmlDB implements Repository<OriginModel> {
  final DBConfiguration _dbCall;

  OriginRepositoryIpmlDB(this._dbCall);
  @override
  Future<List<OriginModel>> findAll(int userId) async {
    String sql = 'SELECT * FROM tb_origin WHERE idUser = ? ORDER BY id ASC';
    var result = await _dbCall.execQuery(sql, [userId]);
    List<OriginModel> list = [];
    for (var row in result) {
      print('id: ${row[0]} Name: ${row[1]}');
      list.add(OriginModel.create(row[0], row[1]));
    }
    return list;
  }

  @override
  Future<bool> create(OriginModel item, int userId) async {
    final String sql = 'INSERT INTO tb_origin (name, idUser) VALUES (?, ?)';
    var result = await _dbCall.execQuery(sql, [item.name, userId]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final String sql = 'DELETE from tb_origin where id = ?';
    var result = await _dbCall.execQuery(sql, [id]);
    return result.affectedRows > 0;
  }
}



//  @override
//   Future<bool> create(value) async {
//     final String sql =
//         'INSERT INTO usuarios (nome, email, password) VALUES (?, ?,?)';
//     var result = await _dbConfiguration
//         .execQuery(sql, [value.name, value.email, value.password]);
//     return result.affectedRows > 0;
//   }

//   @override
//   Future<bool> delete(int id) async {
//     final String sql = 'DELETE from usuarios where id = ?';
//     var result = await _dbConfiguration.execQuery(sql, [id]);
//     return result.affectedRows > 0;
//   }

//   @override
//   Future<List<UserModel>> findAll() async {
//     //var result = await connection.query('SELECT * FROM usuarios;');
//     final String sql = 'SELECT * FROM usuarios';
//     var result = await _dbConfiguration.execQuery(sql);
//     List<UserModel> _users = result
//         .map((e) => UserModel.fromMap(e.fields))
//         .toList()
//         .cast<UserModel>();
// //cast for dynamic object
    // return _users;
  // }

  // @override
  // Future<UserModel?> findOne(int id) async {
  //   final String sql = 'SELECT * FROM usuarios where id = ?';
  //   var result = await _dbConfiguration.execQuery(sql, [id]);
  //   return result.length == 0 ? null : UserModel.fromMap(result.first.fields);
  // }

  // Future<UserModel?> findByEmail(String email) async {
  //   final String sql = 'SELECT * FROM usuarios where email = ?';
  //   var result = await _dbConfiguration.execQuery(sql, [email]);
  //   return result.length == 0 ? null : UserModel.fromEmail(result.first.fields);
  // }

  // @override
  // Future<bool> update(value) async {
  //   final String sql =
  //       'UPDATE usuarios set nome = ?, password = ? where id = ?';

  //   var result = await _dbConfiguration
  //       .execQuery(sql, [value.name, value.password, value.id]);

  //   return result.affectedRows > 0;
  // }
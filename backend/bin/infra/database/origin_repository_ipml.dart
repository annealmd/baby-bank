import '../../domain/model/origin_model.dart';
import '../../domain/port/output/repository.dart';
import 'db_configuration.dart';

class OriginRepositoryIpmlDB implements Repository<OriginModel> {
  final DBConfiguration _dbCall;

  OriginRepositoryIpmlDB(this._dbCall);
  @override
  Future<List<OriginModel>> findAll(int? idUser) async {
    String sql = 'SELECT * FROM tb_origin WHERE idUser = ? ORDER BY id ASC';
    var result = await _dbCall.execQuery(sql, [idUser]);
    List<OriginModel> list = [];
    for (var row in result) {
      print('id: ${row[0]} Name: ${row[1]}');
      list.add(OriginModel.create(row[0], row[1]));
    }
    return list;
  }

  @override
  Future<bool> create(int? idUser, OriginModel item) async {
    final String sql = 'INSERT INTO tb_origin (name, idUser) VALUES (?, ?)';
    var result = await _dbCall.execQuery(sql, [item.name, idUser]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int? idUser, int id) async {
    final String sql = 'DELETE from tb_origin where idUser = ? AND id = ?';
    var result = await _dbCall.execQuery(sql, [idUser, id]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> update(int? idUser, OriginModel item) async {
    final String sql =
        'UPDATE tb_origin SET name = ? WHERE idUser = ? AND id = ?';
    var result = await _dbCall.execQuery(sql, [item.name, idUser, item.id]);
    return result.affectedRows > 0;
  }
}


  // @override
  // Future<bool> update(value) async {
  //   final String sql =
  //       'UPDATE usuarios set nome = ?, password = ? where id = ?';

  //   var result = await _dbConfiguration
  //       .execQuery(sql, [value.name, value.password, value.id]);

  //   return result.affectedRows > 0;
  // }
import '../../domain/model/origin_model.dart';
import '../../domain/port/output/origin_repository.dart';
import 'db_configuration.dart';

class OriginRepositoryIpmlDB implements Repository<OriginModel> {
  final DBConfiguration _dbCall;

  OriginRepositoryIpmlDB(this._dbCall);
  @override
  Future<List<OriginModel>> findAllOrigin() async {
    String sql = 'SELECT * FROM tb_origin ORDER BY id ASC';
    var result = await _dbCall.execQuery(sql);
    List<OriginModel> list = [];
    for (var row in result) {
      //print('id: ${row[0]} Name: ${row[1]}}');
      list.add(OriginModel.create(row[0], row[1]));
    }
    return list;
  }
}

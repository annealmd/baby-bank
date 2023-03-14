import 'package:mysql1/mysql1.dart';

import '../../core/custom_env.dart';
import 'db_configuration.dart';

class MySqlDBConfiguration implements DBConfiguration {
  MySqlConnection? _connection;
  @override
  Future<MySqlConnection> get connection async {
    _connection ??= await createConnection();
    if (_connection == null) {
      throw Exception('[ERROR DB] => Failed to create connection');
    }
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: await CustomEnv.get<String>(key: 'db_host'),
        port: await CustomEnv.get<int>(key: 'db_port'),
        user: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'),
        db: await CustomEnv.get<String>(key: 'db_schema'),
      ),
    );
  }

  @override
  Future execQuery(String sql, [List? params]) async {
    var connect = await connection; //get connection
    return await connect.query(sql, params);
  }
}

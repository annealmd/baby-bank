abstract class DBConfiguration {
  Future<dynamic> createConnection();
  Future<dynamic> get connection;

  //optional not named []
  Future execQuery(String sql, [List? params]);
}

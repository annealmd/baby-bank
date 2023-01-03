import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:mysql1/mysql1.dart';

void main(List<String> arguments) async {
  // await serve((request) => Response.ok('Baby Bank on'), 'localhost', 8080);

  // print('servidor iniciado na http://localhost:8080');

  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'baby_bank',
      password: 'root'));

  var result =
      await conn.query('insert into tb_origin (name) values (?)', ['Tia Anne']);
  print('Inserted row id=${result.insertId}');

  var results = await conn.query('select * from tb_origin');
  for (var row in results) {
    print('id: ${row[0]} Name: ${row[1]}}');
  }
}

// inicia o docker,  workbench, run backend
// netstat -ano | findstr :8080
// taskkill /F /PID <LISTENING>
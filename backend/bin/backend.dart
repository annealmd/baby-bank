import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main(List<String> arguments) async {
  await serve((request) => Response.ok('Baby Bank on'), 'localhost', 8080);

  print('servidor iniciado na http://localhost:8080');
}

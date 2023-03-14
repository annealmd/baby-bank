import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  static Future<void> initialize(
      {required String address,
      required int port,
      required Handler handler}) async {
    await shelf_io.serve(handler, address, port);

    print('Server initialized -> http://$address:$port');
  }
}

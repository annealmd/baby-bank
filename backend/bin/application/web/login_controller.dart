import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../infra/security/security_service_ipml.dart';

class LoginController {
  // TODO service

  Handler get handler {
    final router = Router();

    ///origin/list?idUser=3
    router.get('/login', (Request req) async {
      String? idUser = req.url.queryParameters['idUser'];
      String token = await SercurityServiceIpml().generateJWT(idUser!);
      print(token);

      return Response.ok(token);
    });
    return router;
  }
}

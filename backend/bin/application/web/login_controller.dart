import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'controller.dart';
import '../../infra/security/security_service_ipml.dart';

class LoginController extends Controller {
  @override
  Handler gethandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final router = Router();

    ///login?idUser=3
    router.get('/login', (Request req) async {
      String? idUser = req.url.queryParameters['idUser'];
      String token = await SercurityServiceIpml().generateJWT(idUser!);
      print(token);

      return Response.ok(token);
    });
    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}

import 'package:shelf/shelf.dart';

import 'application/web/login_controller.dart';
import 'application/web/origin_controller.dart';
import 'core/custom_env.dart';
import 'core/injects.dart';
import 'infra/security/security_service_ipml.dart';
import 'infra/service/custom_server.dart';
import 'infra/service/middleware_interception.dart';

void main(List<String> arguments) async {
  final di = Injects.initialize();

  var security = SercurityServiceIpml();

  var cascadeHandler = Cascade()
      .add(di.get<OriginController>().gethandler(
        middlewares: [
          security.authorization,
          security.verifyJWT,
        ],
      ))
      .add(LoginController().gethandler())
      .handler;

  var pipeHandler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middlewareJson)
      .addHandler(cascadeHandler);

  // server
  await CustomServer.initialize(
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'),
      handler: pipeHandler);
}



// inicia o docker,  workbench, run backend
// netstat -ano | findstr :8080
// taskkill /F /PID <LISTENING>
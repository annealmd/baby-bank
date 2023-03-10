import 'package:shelf/shelf.dart';

import 'application/web/login_controller.dart';
import 'application/web/origin_controller.dart';
import 'application/web/user_controller.dart';
import 'core/custom_env.dart';
import 'core/injects.dart';
import 'infra/service/custom_server.dart';
import 'infra/service/middleware_interception.dart';

void main(List<String> arguments) async {
  final di = Injects.initialize();

//get or using the call function
  Handler cascadeHandler = Cascade()
      .add(di.get<UserController>().gethandler())
      .add(di.get<OriginController>().gethandler())
      .add(di<LoginController>().gethandler(isSecurity: true))
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
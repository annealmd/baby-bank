//local middleware
import 'package:shelf/shelf.dart';

import '../../core/dependency_injector.dart';
import '../../infra/security/security_service.dart';

abstract class Controller {
  //security
  Handler gethandler({
    List<Middleware>? middlewares,
    bool isSecurity,
  });

  Handler createHandler({
    required Handler router,
    required bool isSecurity,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];

    if (isSecurity) {
      var securityService = DependencyInjector().get<SecurityService>();
      middlewares.addAll([
        securityService.authorization,
        securityService.verifyJWT,
      ]);
    }
    var pipe = Pipeline();

    for (var m in middlewares) {
      pipe = pipe.addMiddleware(m);
    }

    return pipe.addHandler(router);
  }
}

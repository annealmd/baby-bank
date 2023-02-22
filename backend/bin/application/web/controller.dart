//local middleware
import 'package:shelf/shelf.dart';

abstract class Controller {
  //security
  Handler gethandler({List<Middleware>? middlewares, bool isSecurity});

  Handler createHandler({
    required Handler router,
    required bool isSecurity,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];
    var pipe = Pipeline();

    for (var m in middlewares) {
      pipe.addMiddleware(m);
    }

    return pipe.addHandler(router);
  }
}

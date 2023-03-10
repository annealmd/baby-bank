import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../domain/model/user_model.dart';
import '../../domain/port/input/service.dart';
import 'controller.dart';

class UserController extends Controller {
  final Service _userService;

  UserController(this._userService);
  @override
  Handler gethandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    router.get('/user/list', (Request req) async {
      var getList = await _userService.getList() as List<UserModel>;
      var jsonOrigin = getList.map((e) => e.toJson()).toList().toString();

      print('Here we are $jsonOrigin');
      return Response.ok(jsonOrigin);
    });

    ///user/add
    router.post('/user/add', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) {
        return Response(400);
      }
      var user = UserModel.fromJson(body);
      var result = await _userService.saveItem(item: user);
      return Response(result ? 201 : 500);
    });

    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}

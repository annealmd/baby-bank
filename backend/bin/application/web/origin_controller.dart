import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'controller.dart';
import '../../domain/model/origin_model.dart';
import '../../domain/port/input/service.dart';

class OriginController extends Controller {
  //post and get
  final Service _originService;

  OriginController(this._originService);

  @override
  Handler gethandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    ///origin/list?idUser=3
    router.get('/origin/list', (Request req) async {
      String? idUser = req.url.queryParameters['idUser'];
      var getList = await _originService.getList(idUser: int.parse(idUser!))
          as List<OriginModel>;
      var jsonOrigin = getList.map((e) => e.toJson()).toList().toString();

      print('Here we are $jsonOrigin');
      return Response.ok(jsonOrigin);
    });

    ///origin/add?idUser=3&name=luciana
    router.post('/origin/add', (Request req) async {
      String? idUser = req.url.queryParameters['idUser'];
      String? name = req.url.queryParameters['name'];
      var item = OriginModel()..name = name;
      bool result =
          await _originService.addItem(idUser: int.parse(idUser!), item: item);
      return Response(result ? 200 : 400);
    });

    // /origin/del?idUser=3&itemId=21

    router.delete('/origin/del', (Request req) async {
      String? idUser = req.url.queryParameters['idUser'];
      String? itemId = req.url.queryParameters['itemId'];
      print('------ $idUser ----- $itemId');
      bool result = await _originService.deleteItem(
        idUser: int.parse(idUser!),
        id: int.parse(itemId!),
      );
      return Response(result ? 200 : 400);
    });

    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}

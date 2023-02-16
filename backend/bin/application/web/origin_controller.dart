import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../domain/model/origin_model.dart';
import '../../domain/port/input/service.dart';

class OriginController {
  //post and get
  final Service _originService;

  OriginController(this._originService);
  void getAll(int userId) async {
    var originList = await _originService.getList(userId);
    originList.forEach(print);
  }

  Future<bool> addOrigin(String name, int userId) async {
    var item = OriginModel()..name = name;
    return await _originService.addItem(item, userId);
  }

  Future<bool> deleteOrigin(int id) async {
    return await _originService.deleteItem(id);
  }

  Handler get handler {
    final router = Router();

    router.get('/origin', (Request req) async {
      var getList = await _originService.getList(3) as List<OriginModel>;
      List jsonOrigin = getList.map((e) => e.toJson()).toList();
      print('Here we are $jsonOrigin');
      return Response.ok(jsonOrigin);
    });

    return router;
  }
}

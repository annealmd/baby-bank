import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../domain/model/origin_model.dart';
import '../../domain/port/input/service.dart';

class OriginController {
  //post and get
  final Service _originService;

  OriginController(this._originService);
  void getAll() async {
    var originList = await _originService.getList();
    originList.forEach(print);
  }

  Future<bool> addOrigin(String name) async {
    var item = OriginModel()..name = name;
    return await _originService.addItem(item);
  }

  Future<bool> deleteOrigin(int id) async {
    return await _originService.deleteItem(id);
  }

  Handler get handler {
    final router = Router();

    router.get('/origin', (Request req) async {
      var getList = await _originService.getList() as List<OriginModel>;
      List jsonOrigin = getList.map((e) => e.toJson()).toList();
      return Response.ok('Bem vindo $jsonOrigin');
    });

    return router;
  }
}

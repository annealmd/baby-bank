import '../../domain/port/input/service.dart';

class OriginController {
  //post and get
  final Service _originService;

  OriginController(this._originService);
  void getAll() async {
    var originList = await _originService.getListOrigin();
    originList.forEach(print);
  }
}

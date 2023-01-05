import '../../domain/port/input/origin_service.dart';

class OriginController {
  //post and get
  final OriginService _originService;

  OriginController(this._originService);
  void getAll() {
    _originService.getListOrigin().forEach(print);
  }
}

import '../../model/origin_model.dart';

abstract class Service<T> {
  Future<List<T>> getListOrigin();
}

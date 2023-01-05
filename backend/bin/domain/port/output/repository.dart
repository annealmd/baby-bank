import '../../model/origin_model.dart';

abstract class Repository<T> {
  Future<List<T>> findAllOrigin();
}

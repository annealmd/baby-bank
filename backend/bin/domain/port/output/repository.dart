import '../../model/origin_model.dart';

abstract class Repository<T> {
  Future<List<T>> findAll();
  Future<bool> create(T item);
  Future<bool> delete(int id);
}

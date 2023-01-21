abstract class Repository<T> {
  Future<List<T>> findAll();
  Future<bool> create(T item);
  Future<bool> delete(int id);
}

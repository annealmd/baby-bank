abstract class Repository<T> {
  Future<List<T>> findAll(int userId);
  Future<bool> create(T item, int userId);
  Future<bool> delete(int id);
}

abstract class Service<T> {
  Future<List<T>> getList(int userId);

  Future<bool> addItem(T item, int userId);

  Future<bool> deleteItem(int id);
}

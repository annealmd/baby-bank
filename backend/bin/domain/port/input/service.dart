abstract class Service<T> {
  Future<List<T>> getList();

  Future<bool> addItem(T item);

  Future<bool> deleteItem(int id);
}

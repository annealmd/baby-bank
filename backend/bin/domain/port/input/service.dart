abstract class Service<T> {
  Future<List<T>> getList(int userId);

  Future<bool> addItem(int idUser, T item);

  Future<bool> deleteItem(int idUser, int id);
}

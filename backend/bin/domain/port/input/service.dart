abstract class Service<T> {
  Future<List<T>> getList({int? idUser});

  Future<bool> addItem({int? idUser, required T item});

  Future<bool> deleteItem({int? idUser, required int id});
}

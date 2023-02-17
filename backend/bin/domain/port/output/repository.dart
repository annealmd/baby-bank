abstract class Repository<T> {
  Future<List<T>> findAll(int idUser);
  Future<bool> create(int idUser, T item);
  Future<bool> delete(int idUser, int id);
}

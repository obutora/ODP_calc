abstract class IsarRepositoryInterface<T> {
  Future<List?> getAll();
  Future getById(int id);
  Future<int> put(T entity);
  Future<void> deleteById(int id);
  Future<bool> isExistById(int id);
}

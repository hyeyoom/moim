abstract class LocalStorage {
  Future<bool> init();
  void dispose();
  void save(String key, String value);
  String? load(String key);
}

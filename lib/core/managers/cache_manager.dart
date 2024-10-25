class CacheManager{
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;
  CacheManager._internal();

  final Map<String, dynamic> _cache = {};

  void set(String key, dynamic value) {
    _cache[key] = value;
  }

  dynamic get(String key) {
    return _cache[key];
  }

  void remove(String key) {
    _cache.remove(key);
  }

  void clear() {
    _cache.clear();
  }
}
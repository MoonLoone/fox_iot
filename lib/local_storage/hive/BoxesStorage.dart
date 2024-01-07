
class BoxesStorage {
  static final BoxesStorage _boxesStorage = BoxesStorage._internal();

  factory BoxesStorage() {
    return _boxesStorage;
  }

  BoxesStorage._internal();
}

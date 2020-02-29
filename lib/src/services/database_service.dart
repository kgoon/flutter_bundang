class DatabaseService {
  DatabaseService._internal();

  factory DatabaseService.fromSingleton() {
    return _instance;
  }

  static final DatabaseService _instance = DatabaseService._internal();
}

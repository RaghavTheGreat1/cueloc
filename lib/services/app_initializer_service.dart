class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 5));
    print("5 sec");
  }
}

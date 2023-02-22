abstract class AppDataSource {
  Future<dynamic> postData({
    required String token,
    required String id,
    required String postUrlPath,
    required Map<String, dynamic> data,
  });

  Future<dynamic> getRandomData({
    required String token,
    String? id,
    required String getURLPath,
  });
}

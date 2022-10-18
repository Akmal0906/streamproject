abstract class BaseService {
  final String baseUrl = "https://api.quotable.io";

  Future<dynamic> getResponse(String url);
}

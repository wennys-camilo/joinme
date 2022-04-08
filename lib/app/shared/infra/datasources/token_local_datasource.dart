abstract class TokenLocalDatasource {
  Future<void> setToken(String value);
  Future<String?> getToken();
  Future<void> refreshToken(String value);
  Future<String?> getRefreshToken();
}

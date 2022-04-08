import '../../infra/datasources/token_remote_datasource.dart';
import '../adapters/http_client/http_client_adapter.dart';

class TokenRemoteDatasourceImpl implements TokenRemoteDatasource {
  final IHttpClientAdapter _httpClient;
  TokenRemoteDatasourceImpl(this._httpClient);
}

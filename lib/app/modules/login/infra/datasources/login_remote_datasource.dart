import '../../domain/entities/authenticate_entity.dart';
import '../../domain/entities/response_auth_entity.dart';

abstract class LoginRemoteDatasource {
  Future<ResponseAuthEntity> signin({required AuthenticateEntity userAuth});
}

import '../../domain/entities/response_auth_entity.dart';
import 'token_mapper.dart';
import '../../../../shared/external/mappers/user_mapper.dart';

class ResonseAuthMapper {
  ResponseAuthEntity to(Map<String, dynamic> map) {
    return ResponseAuthEntity(
      token: TokenMapper().to(map),
      user: UserMapper().to(map['user']),
    );
  }
}

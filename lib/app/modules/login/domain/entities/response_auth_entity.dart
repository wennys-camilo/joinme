import 'token_enity.dart';
import '../../../../shared/domain/entites/user_enity.dart';

class ResponseAuthEntity {
  final TokenEnity token;
  final UserEntity user;
  const ResponseAuthEntity({required this.token, required this.user});
}

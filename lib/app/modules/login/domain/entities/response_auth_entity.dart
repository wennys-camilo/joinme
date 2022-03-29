import 'token_enity.dart';
import 'user_enity.dart';

class ResponseAuthEntity {
  TokenEnity token;
  UserEntity user;
  ResponseAuthEntity({required this.token, required this.user});
}

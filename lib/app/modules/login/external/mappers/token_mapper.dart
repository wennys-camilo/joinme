import '../../domain/entities/token_enity.dart';

class TokenMapper {
  TokenEnity to(Map<String, dynamic> map) {
    return TokenEnity(
      token: map['token'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }
}

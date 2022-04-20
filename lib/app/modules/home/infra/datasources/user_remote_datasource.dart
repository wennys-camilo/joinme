import '../../../../shared/domain/entites/user_enity.dart';

abstract class UserRemoteDataSource {
  Future<void> postMood(String moodId);
  Future<UserEntity> fetchUser();
}

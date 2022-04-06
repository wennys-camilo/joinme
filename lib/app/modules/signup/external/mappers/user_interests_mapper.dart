import '../../domain/entities/user_interests_entity.dart';

class UserInterestsMapper {
  Map<String, dynamic> to(UserInterestsEntity userInterestsEntity) {
    return {
      'userId': userInterestsEntity.userId,
      'activityIds': userInterestsEntity.activityIds,
    };
  }
}

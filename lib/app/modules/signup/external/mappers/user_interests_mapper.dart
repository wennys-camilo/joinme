import '../../domain/entities/user_interests_entity.dart';

class UserInterestsMapper {
  Map<String, dynamic> to(UserInterestsEntity userInterestsEntity) {
    return {
      'activityIds': userInterestsEntity.activityIds,
    };
  }
}

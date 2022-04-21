import 'package:camp_final/app/modules/home/domain/entities/activities_description_entity.dart';
import 'package:camp_final/app/shared/domain/entites/user_enity.dart';

class ProfileState {
  final UserEntity userEntity;
  final List<ActivitiesDescriptionEntity> interestsUserList;

  ProfileState({
    required this.userEntity,
    required this.interestsUserList,
  });

  ProfileState copyWith({
    UserEntity? userEntity,
    List<ActivitiesDescriptionEntity>? interestsUserList,
  }) {
    return ProfileState(
      userEntity: userEntity ?? this.userEntity,
      interestsUserList: interestsUserList ?? this.interestsUserList,
    );
  }
}

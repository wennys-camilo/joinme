import '../../../domain/entities/activities_description_entity.dart';
import '../../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../../shared/domain/entites/user_enity.dart';

class ProfileState {
  final UserEntity userEntity;
  final List<ActivitiesDescriptionEntity> interestsUserList;
  final List<DisabilitiesEntity> disabilitiesList;
  ProfileState({
    required this.userEntity,
    required this.interestsUserList,
    required this.disabilitiesList,
  });

  bool get hasAboutMe =>
      userEntity.aboutMe != null && userEntity.aboutMe!.isNotEmpty;

  ProfileState copyWith({
    UserEntity? userEntity,
    List<ActivitiesDescriptionEntity>? interestsUserList,
    List<DisabilitiesEntity>? disabilitiesList,
  }) {
    return ProfileState(
      userEntity: userEntity ?? this.userEntity,
      interestsUserList: interestsUserList ?? this.interestsUserList,
      disabilitiesList: disabilitiesList ?? this.disabilitiesList,
    );
  }
}

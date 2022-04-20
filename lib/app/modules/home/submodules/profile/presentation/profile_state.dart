import 'package:camp_final/app/shared/domain/entites/user_enity.dart';

class ProfileState {
  final UserEntity userEntity;
  ProfileState({
    required this.userEntity,
  });

  ProfileState copyWith({
    UserEntity? userEntity,
  }) {
    return ProfileState(
      userEntity: userEntity ?? this.userEntity,
    );
  }
}

import '../../domain/entites/user_enity.dart';

class UserState {
  final UserEntity user;
  UserState({required this.user});

  UserState copyWith({
    UserEntity? user,
  }) {
    return UserState(user: user ?? this.user);
  }
}

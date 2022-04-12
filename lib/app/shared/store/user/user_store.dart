import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/entites/user_enity.dart';
import '../../domain/helpers/errors/failure.dart';
import 'user_state.dart';

class UserStore extends StreamStore<Failure, UserState> {
  UserStore()
      : super(
          UserState(
            user: UserEntity(
                id: "",
                email: "",
                name: "",
                phone: "",
                emergencyName: "",
                emergencyPhone: "",
                updatedAt: "",
                createdAt: ""),
          ),
        );

  setUser(UserEntity user) {
    update(state.copyWith(user: user));
  }
}

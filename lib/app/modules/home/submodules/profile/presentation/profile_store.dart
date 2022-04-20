import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/domain/entites/user_enity.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/usecases/fetch_user_usecase.dart';
import 'profile_state.dart';

class ProfileStore extends StreamStore<Failure, ProfileState> {
  final FetchUserUsecase _fetchUserUsecase;

  ProfileStore(this._fetchUserUsecase)
      : super(ProfileState(userEntity: UserEntity(name: '', email: '')));

  Future<void> fetchProfile() async {
    setLoading(true);
    final response = await _fetchUserUsecase();
    response.fold(setError, (response) {
      update(state.copyWith(userEntity: response));
    });
    setLoading(false);
  }
}

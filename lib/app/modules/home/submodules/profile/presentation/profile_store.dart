import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/domain/entites/user_enity.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/usecases/fetch_user_interests_usecase.dart';
import '../../../domain/usecases/fetch_user_usecase.dart';
import 'profile_state.dart';

class ProfileStore extends StreamStore<Failure, ProfileState> {
  final FetchUserUsecase _fetchUserUsecase;
  final FetchUserInterestsUsecase _fetchUserInterestsUsecase;
  ProfileStore(this._fetchUserUsecase, this._fetchUserInterestsUsecase)
      : super(ProfileState(
          userEntity: UserEntity(name: '', email: ''),
          interestsUserList: [],
        ));

  Future<void> fetchProfile() async {
    setLoading(true);
    final response = await _fetchUserUsecase();
    response.fold(setError, (response) {
      update(state.copyWith(userEntity: response));
    });
    setLoading(false);
  }

  Future<void> fetchInterest() async {
    setLoading(true);
    final response = await _fetchUserInterestsUsecase();
    response.fold(setError, (response) {
      update(state.copyWith(interestsUserList: response));
    });
    setLoading(false);
  }
}

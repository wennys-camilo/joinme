import 'package:camp_final/app/modules/home/domain/repositories/user_repositoy.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import 'post_mood_user_usecase.dart';

class PostMoodUserUsecaseImpl implements PostMoodUserUsecase {
  final UserRepository _repository;

  const PostMoodUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    final result = await _repository.postMood(id);
    return result;
  }
}

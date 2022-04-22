import 'package:dartz/dartz.dart';
import '../entities/user_interests_entity.dart';
import '../repositories/interests_repository.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import 'insert_interests_usecase.dart';

class InsertInterestsUsecaseImpl implements InsertInterestsUsecase {
  final InterestsRepository _repository;
  const InsertInterestsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      UserInterestsEntity userInterestsEntity) async {
    final result = await _repository.insert(userInterestsEntity);
    return result;
  }
}

import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/interests_entity.dart';
import '../repositories/interests_repository.dart';
import 'fetch_interests_usecase.dart';

class FetchInterestsUsecaseImpl implements FetchInterestsUsecase {
  final InterestsRepository _repository;

  const FetchInterestsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<InterestsEntity>>> call() async {
    final result = await _repository.fetch();
    return result;
  }
}

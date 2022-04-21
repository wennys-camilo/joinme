import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/activities_description_entity.dart';
import '../repositories/user_repositoy.dart';
import 'fetch_user_interests_usecase.dart';

class FetchUserInterestsUsecaseImpl implements FetchUserInterestsUsecase {
  final UserRepository _repository;

  const FetchUserInterestsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<ActivitiesDescriptionEntity>>> call() async {
    final result = await _repository.fetchInterest();
    return result;
  }
}

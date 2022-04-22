import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/user_repositoy.dart';
import 'fetch_user_disabilities_usecase.dart';

class FetchUserDisabilitiesUsecaseImpl implements FetchUserDisabilitiesUsecase {
  final UserRepository _repository;

  const FetchUserDisabilitiesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<DisabilitiesEntity>>> call() async {
    final result = await _repository.fetchDisabilitiesUser();
    return result;
  }
}

import 'package:camp_final/app/shared/domain/entites/disabilities_enity.dart';
import 'package:camp_final/app/shared/domain/repositories/disabilities_repository.dart';
import 'package:camp_final/app/shared/domain/usecases/fetch_all_disabilities_usecase.dart';
import 'package:dartz/dartz.dart';
import '../helpers/errors/failure.dart';

class FetchAllDisabilitiesUsecaseImpl implements FetchAllDisabilitiesUsecase {
  final DisabilitiesRepository _repository;

  const FetchAllDisabilitiesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<DisabilitiesEntity>>> call() async {
    final result = await _repository.fetchList();
    return result;
  }
}

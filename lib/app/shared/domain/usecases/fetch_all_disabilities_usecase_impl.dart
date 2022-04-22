import 'package:dartz/dartz.dart';
import '../entites/disabilities_enity.dart';
import '../helpers/errors/failure.dart';
import '../repositories/disabilities_repository.dart';
import 'fetch_all_disabilities_usecase.dart';

class FetchAllDisabilitiesUsecaseImpl implements FetchAllDisabilitiesUsecase {
  final DisabilitiesRepository _repository;

  const FetchAllDisabilitiesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<DisabilitiesEntity>>> call() async {
    final result = await _repository.fetchList();
    return result;
  }
}

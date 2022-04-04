import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/onborading_repository.dart';
import 'check_first_acess_usecase.dart';

class CheckFirstAcessUsecaseImpl implements CheckFirstAcessUsecase {
  final OnboradingRepository _repository;

  const CheckFirstAcessUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call() async {
    final result = await _repository.check();
    return result;
  }
}

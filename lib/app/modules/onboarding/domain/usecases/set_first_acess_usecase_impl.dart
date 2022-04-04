import 'set_first_acess_usecase.dart';
import '../repositories/onborading_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

class SetFirstAcessUsecaseImpl implements SetFirstAcessUsecase {
  final OnboradingRepository _repository;

  const SetFirstAcessUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, void>> call(bool value) async {
    final result = await _repository.firstAcess(value);
    return result;
  }
}

import 'package:camp_final/app/modules/signup/domain/entities/user_disabilities_entity.dart';
import 'package:camp_final/app/modules/signup/domain/repositories/signup_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import 'insert_disabilities_usecase.dart';

class InsertDisabilitiesUsecaseImpl implements InsertDisabilitiesUsecase {
  final SignupRepository _repository;

  const InsertDisabilitiesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      UserDisabilitiesEntity userDisabilitiesEntity) async {
    final result = await _repository.insertDisabilities(userDisabilitiesEntity);
    return result;
  }
}

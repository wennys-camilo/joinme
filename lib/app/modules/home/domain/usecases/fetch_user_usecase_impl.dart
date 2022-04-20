import 'package:camp_final/app/modules/home/domain/repositories/user_repositoy.dart';
import 'package:camp_final/app/shared/domain/entites/user_enity.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import 'fetch_user_usecase.dart';

class FetchUserUsecaseImpl implements FetchUserUsecase {
  final UserRepository _repository;

  const FetchUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    final result = await _repository.fetch();
    return result;
  }
}

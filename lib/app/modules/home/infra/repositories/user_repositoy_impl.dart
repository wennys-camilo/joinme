import 'package:camp_final/app/modules/home/infra/datasources/user_remote_datasource.dart';
import 'package:camp_final/app/shared/domain/entites/user_enity.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/user_repositoy.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  const UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Unit>> postMood(id) async {
    try {
      await _remoteDataSource.postMood(id);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetch() async {
    try {
      final result = await _remoteDataSource.fetchUser();
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

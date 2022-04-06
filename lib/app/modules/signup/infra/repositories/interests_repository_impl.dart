import 'package:camp_final/app/modules/signup/domain/entities/interests_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../datasources/interests_remote_datasource.dart';
import '../../domain/repositories/interests_repository.dart';

class InterestsRepositoryImpl implements InterestsRepository {
  final InterestsRemoteDatasource _remoteDatasource;
  InterestsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<InterestsEntity>>> fetch() async {
    try {
      final response = await _remoteDatasource.fetch();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

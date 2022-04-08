import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/interests_entity.dart';
import '../../domain/entities/user_interests_entity.dart';
import '../../domain/repositories/interests_repository.dart';
import '../datasources/interests_remote_datasource.dart';

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

  @override
  Future<Either<Failure, Unit>> insert(
      UserInterestsEntity userInterestsEntity) async {
    try {
      await _remoteDatasource.insert(userInterestsEntity);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

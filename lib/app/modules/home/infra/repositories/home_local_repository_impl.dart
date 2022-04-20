import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/home_local_repository.dart';
import '../datasources/home_local_datasource.dart';

class HomeLocalRepositoryImpl implements HomeLocalRepository {
  final HomeLocalDatasource _localDatasource;

  const HomeLocalRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, Unit>> setAcess() async {
    try {
      await _localDatasource.setAcessMood();
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, bool>> check() async {
    try {
      final response = await _localDatasource.displayMood();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

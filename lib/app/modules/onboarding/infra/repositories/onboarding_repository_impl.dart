import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/onborading_repository.dart';
import '../datasources/onborading_local_datasource.dart';

class OnboradingRepositoryImpl implements OnboradingRepository {
  final OnboardingLocalDatasource _localDatasource;

  const OnboradingRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, Unit>> firstAcess(bool value) async {
    try {
      await _localDatasource.firstAcess(value);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, bool>> check() async {
    try {
      final response = await _localDatasource.check();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

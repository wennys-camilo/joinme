import 'package:dartz/dartz.dart';

import '../../domain/entites/disabilities_enity.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../domain/repositories/disabilities_repository.dart';
import '../datasources/disabilities_remote_datasource.dart';

class DisabilitiesRepositoryImpl implements DisabilitiesRepository {
  final DisabilitiesRemoteDatasource _remoteDatasource;

  const DisabilitiesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<DisabilitiesEntity>>> fetchList() async {
    try {
      final response = await _remoteDatasource.fetch();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

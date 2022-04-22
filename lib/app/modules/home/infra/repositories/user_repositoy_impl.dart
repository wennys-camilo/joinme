import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/activities_description_entity.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/repositories/user_repositoy.dart';
import '../datasources/user_remote_datasource.dart';

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

  @override
  Future<Either<Failure, List<ActivitiesDescriptionEntity>>>
      fetchInterest() async {
    try {
      final result = await _remoteDataSource.fetchActivities();
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<EventDescriptionEntity>>>
      fetchEventsUser() async {
    try {
      final result = await _remoteDataSource.userEvents();
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<DisabilitiesEntity>>>
      fetchDisabilitiesUser() async {
    try {
      final result = await _remoteDataSource.disabilities();
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}

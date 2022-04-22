import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_signup_entity.dart';
import '../repositories/signup_repository.dart';
import 'insert_city_user_usecase.dart';

class InsertCityUserUsecaseImpl implements InsertCityUserUsecase {
  final SignupRepository _repository;

  const InsertCityUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserSignupEntity>> call(String city) async {
    final result = await _repository.updateCity(city);
    return result;
  }
}

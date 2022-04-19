import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/token_repository.dart';
import 'set_token_usecase.dart';

class SetTokenUsecaseImpl implements SetTokenUsecase {
  final TokenRepository _repository;

  const SetTokenUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String token) async {
    final result = await _repository.setToken(token);
    return result;
  }
}

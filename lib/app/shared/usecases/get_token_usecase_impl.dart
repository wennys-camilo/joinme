import 'package:dartz/dartz.dart';
import '../domain/helpers/errors/failure.dart';
import '../domain/repositories/token_repository.dart';
import 'get_token_usecase.dart';

class GetTokenUsecaseImpl implements GetTokenUsecase {
  final TokenRepository _repository;

  const GetTokenUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, String?>> fetch() async {
    final result = await _repository.getToken();
    return result;
  }
}

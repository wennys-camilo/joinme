import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../repositories/token_repository.dart';
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

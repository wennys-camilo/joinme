import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/home_local_repository.dart';
import 'set_acess_mood_usecase.dart';

class SetAcessMoodUsecaseImpl implements SetAcessMoodUsecase {
  final HomeLocalRepository _localRepository;

  SetAcessMoodUsecaseImpl(this._localRepository);

  @override
  Future<Either<Failure, Unit>> call() async {
    final result = await _localRepository.setAcess();
    return result;
  }
}

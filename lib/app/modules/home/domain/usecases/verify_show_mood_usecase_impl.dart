import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/home_local_repository.dart';
import 'verify_show_mood_usecase.dart';

class VerifyShowMoodUsecaseImpl implements VerifyShowMoodUsecase {
  final HomeLocalRepository _localRepository;

  VerifyShowMoodUsecaseImpl(this._localRepository);

  @override
  Future<Either<Failure, bool>> call() async {
    final result = await _localRepository.check();
    return result;
  }
}

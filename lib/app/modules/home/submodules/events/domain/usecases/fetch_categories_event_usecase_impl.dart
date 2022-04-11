import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/events_categories_entity.dart';
import '../repositories/events_repository.dart';
import 'fetch_categories_event_usecase.dart';

class FetchCategorieEventUsecaseImpl implements FetchCategorieEventUsecase {
  final EventsRepository _repository;

  FetchCategorieEventUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<EventCategorieEntity>>> call() async {
    final result = await _repository.categoriesEvent();
    return result;
  }
}

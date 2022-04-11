import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/events_categories_entity.dart';

abstract class FetchCategorieEventUsecase {
  Future<Either<Failure, List<EventCategorieEntity>>> call();
}

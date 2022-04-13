import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/event_address_entity.dart';
import '../repositories/events_repository.dart';
import 'create_event_usecase.dart';

class CreateEventUsecaseImpl implements CreateEventUsecase {
  final EventsRepository _repository;

  CreateEventUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      EventAddressEntity eventAddressEntity) async {
    final result = _repository.create(eventAddressEntity);
    return result;
  }
}

import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/event_address_entity.dart';

abstract class CreateEventUsecase {
  Future<Either<Failure, Unit>> call(EventAddressEntity eventAddressEntity);
}

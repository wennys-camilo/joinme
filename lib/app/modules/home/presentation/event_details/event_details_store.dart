import 'package:camp_final/app/modules/home/presentation/event_details/event_details_state.dart';
import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:flutter_triple/flutter_triple.dart';

class EventDetailsStore extends StreamStore<Failure, EventDetailsState> {
  EventDetailsStore() : super(EventDetailsState());
}

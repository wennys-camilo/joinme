import 'package:camp_final/app/modules/home/domain/entities/attendees_entity.dart';
import 'package:camp_final/app/modules/home/domain/usecases/fetch_all_status_events_attendees_usecase.dart';
import 'package:camp_final/app/modules/home/domain/usecases/set_attendees_status_usecase.dart';
import 'package:camp_final/app/modules/home/presentation/event_details/event_details_state.dart';
import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:flutter_triple/flutter_triple.dart';

class EventDetailsStore extends StreamStore<Failure, EventDetailsState> {
  final SetAttendeesStatusUsecase _setAttendeesStatusUsecase;
  final FetchAllStatusEventsAttendeesUsecase
      _fetchAllStatusEventsAttendeesUsecase;
  EventDetailsStore(this._setAttendeesStatusUsecase,
      this._fetchAllStatusEventsAttendeesUsecase)
      : super(EventDetailsState(favorites: []));

  Future<void> getFavorites(String eventId) async {
    final response = await _fetchAllStatusEventsAttendeesUsecase("SAVED");
    response.fold(setError, (result) {
      update(state.copyWith(favorites: result));
      check(eventId);
    });
  }

  check(String eventId) {
    var contain =
        state.favorites.where((element) => element.eventId == eventId);
    if (contain.isEmpty) {
      update(state.copyWith(isFavorite: false));
    } else {
      update(state.copyWith(isFavorite: true));
    }
  }

  Future<void> favorite(String id) async {
    final response = await _setAttendeesStatusUsecase(
        AttendeesEntity(status: 'SAVED', eventId: id));
    response.fold(setError, (result) {
      update(state.copyWith(isFavorite: true));
    });
  }
}

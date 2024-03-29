import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/attendees_entity.dart';
import '../../domain/usecases/fetch_all_status_events_attendees_usecase.dart';
import '../../domain/usecases/set_attendees_status_usecase.dart';
import 'event_details_state.dart';

class EventDetailsStore extends StreamStore<Failure, EventDetailsState> {
  final SetAttendeesStatusUsecase _setAttendeesStatusUsecase;
  final FetchAllStatusEventsAttendeesUsecase
      _fetchAllStatusEventsAttendeesUsecase;
  EventDetailsStore(this._setAttendeesStatusUsecase,
      this._fetchAllStatusEventsAttendeesUsecase)
      : super(EventDetailsState(favorites: [], confirmeds: []));

  Future<void> getFavorites(String eventId) async {
    final response = await _fetchAllStatusEventsAttendeesUsecase("SAVED");
    response.fold(setError, (result) {
      update(state.copyWith(favorites: result));
      checkFavoriteId(eventId);
    });
  }

  checkFavoriteId(String eventId) {
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
    update(state.copyWith(isFavorite: true));
    response.fold(setError, (result) {
      update(state.copyWith(isFavorite: true));
    });
  }

  Future<void> getConfirmeds(String eventId) async {
    final response = await _fetchAllStatusEventsAttendeesUsecase("CONFIRMED");
    response.fold(setError, (result) {
      update(state.copyWith(confirmeds: result));
      checkConfirmedId(eventId);
    });
  }

  checkConfirmedId(String eventId) {
    var contain =
        state.confirmeds.where((element) => element.eventId == eventId);
    if (contain.isEmpty) {
      update(state.copyWith(isConfirmed: false));
    } else {
      update(state.copyWith(isConfirmed: true));
    }
  }

  Future<void> confirmed(String id) async {
    final response = await _setAttendeesStatusUsecase(
        AttendeesEntity(status: 'CONFIRMED', eventId: id));
    update(state.copyWith(isConfirmed: true));
    response.fold(setError, (result) {
      update(state.copyWith(isConfirmed: true));
    });
  }
}

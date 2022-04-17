import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/store/user/user_store.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/usecases/fetch_all_events_usecase.dart';
import 'home_state.dart';

class HomeStore extends NotifierStore<Failure, HomeState> {
  final UserStore userStore;

  final FetchAllEventsUsecase _fetchAllEventsUsecase;

  HomeStore(this.userStore, this._fetchAllEventsUsecase)
      : super(HomeState(events: [], promotedEvents: []));

  Future<void> fetchEvents() async {
    final response = await _fetchAllEventsUsecase();
    response.fold(setError, (result) {
      List<EventDescriptionEntity> promoted = [];
      for (var element in result) {
        if (element.isPromoted) {
          promoted.add(element);
        }
      }
      update(state.copyWith(events: result, promotedEvents: promoted));
    });
  }
}

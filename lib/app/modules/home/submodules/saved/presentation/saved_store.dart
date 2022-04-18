import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/usecases/fetch_all_status_events_attendees_usecase.dart';
import 'saved_state.dart';

class SavedStore extends StreamStore<Failure, SavedState> {
  final FetchAllStatusEventsAttendeesUsecase
      _fetchAllStatusEventsAttendeesUsecase;

  SavedStore(this._fetchAllStatusEventsAttendeesUsecase)
      : super(SavedState(attendes: []));

  Future<void> fetchSaveds() async {
    setLoading(true);
    final response = await _fetchAllStatusEventsAttendeesUsecase("SAVED");
    response.fold(setError, (result) {
      update(state.copyWith(attendes: result));
    });
    setLoading(false);
  }
}

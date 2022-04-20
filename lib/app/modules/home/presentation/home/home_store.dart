import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/store/user/user_store.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/entities/mood_entity.dart';
import '../../domain/usecases/fetch_all_events_usecase.dart';
import '../../domain/usecases/fetch_all_status_events_attendees_usecase.dart';
import '../../domain/usecases/get_mood_usecase.dart';
import '../../domain/usecases/post_mood_user_usecase.dart';
import '../../domain/usecases/set_acess_mood_usecase.dart';
import '../../domain/usecases/verify_show_mood_usecase.dart';
import 'home_state.dart';

class HomeStore extends NotifierStore<Failure, HomeState> {
  final UserStore userStore;

  final FetchAllEventsUsecase _fetchAllEventsUsecase;
  final FetchAllStatusEventsAttendeesUsecase
      _fetchAllStatusEventsAttendeesUsecase;
  final GetMoodUsecase _getMoodUsecase;
  final PostMoodUserUsecase _postMoodUserUsecase;

  final SetAcessMoodUsecase _setAcessMoodUsecase;
  final VerifyShowMoodUsecase _verifyShowMoodUsecase;

  HomeStore(
    this.userStore,
    this._fetchAllEventsUsecase,
    this._fetchAllStatusEventsAttendeesUsecase,
    this._getMoodUsecase,
    this._postMoodUserUsecase,
    this._setAcessMoodUsecase,
    this._verifyShowMoodUsecase,
  ) : super(
          HomeState(
            events: [],
            promotedEvents: [],
            attendees: [],
            moods: [],
            selectedMood: null,
            showMood: false,
          ),
        );

  onChangeMood(MoodEntity value) {
    update(state.copyWith(selectedMood: value));
  }

  Future<void> fechMoods() async {
    final response = await _getMoodUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(moods: result));
    });
  }

  bool isFavorite(String eventId) {
    var contain =
        state.attendees.where((element) => element.eventId == eventId);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> getFavorites() async {
    final response = await _fetchAllStatusEventsAttendeesUsecase('SAVED');
    response.fold(setError, (result) {
      update(state.copyWith(attendees: result));
    });
  }

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

  Future<void> postMood() async {
    final reponse = await _postMoodUserUsecase(state.selectedMood!.id);
    reponse.fold(setError, (result) {
      Modular.to.pop();
      update(state.copyWith(selectedMood: null));
    });
  }

  Future<void> checkShowMood() async {
    final response = await _verifyShowMoodUsecase();
    response.fold(setError, (result) async {
      update(state.copyWith(showMood: result));
      if (state.showMood) {
        await setMood();
      }
    });
  }

  Future<void> setMood() async {
    final response = await _setAcessMoodUsecase();
    response.fold(setError, (result) {});
  }
}

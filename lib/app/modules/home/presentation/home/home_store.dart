import 'package:camp_final/app/modules/home/domain/usecases/fetch_tips_usecase.dart';
import 'package:camp_final/app/modules/home/domain/usecases/fetch_user_events_usecase.dart';
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
  final FetchUserEventsUsecase _fetchUserEventsUsecase;
  final FetchTipsUsecase _fetchTipsUsecase;

  HomeStore(
    this.userStore,
    this._fetchAllEventsUsecase,
    this._fetchAllStatusEventsAttendeesUsecase,
    this._getMoodUsecase,
    this._postMoodUserUsecase,
    this._setAcessMoodUsecase,
    this._verifyShowMoodUsecase,
    this._fetchUserEventsUsecase,
    this._fetchTipsUsecase,
  ) : super(
          HomeState(
            events: [],
            promotedEvents: [],
            attendees: [],
            userDrivenEventsList: [],
            moods: [],
            onlineEvents: [],
            selectedMood: null,
            showMood: false,
            tipsList: [],
            filterAccessibility: [
              'Todas',
              'Física',
              'Visual',
              'Auditiva',
              'Múltipla',
              'Intelectual'
            ],
            filterCategory: [
              'Yoga',
              'Futebol',
              'Vôlei',
              'Corrida',
              'Meditação',
              'Música',
              'Arte',
              'Cinema',
              'Academia'
            ],
            selecTedCategory: [],
            selectedAccessibility: [],
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

  selectedChangeAccessibility(String value) {
    List<String> accessibility = [];
    if (state.selectedAccessibility.contains(value)) {
      accessibility.addAll([...state.selectedAccessibility]..remove(value));
    } else {
      accessibility.addAll([...state.selectedAccessibility, value]);
    }
    update(state.copyWith(selectedAccessibility: accessibility));
  }

  selectedChangeCategorie(String value) {
    List<String> categories = [];
    if (state.selecTedCategory.contains(value)) {
      categories.addAll([...state.selecTedCategory]..remove(value));
    } else {
      categories.addAll([...state.selecTedCategory, value]);
    }
    update(state.copyWith(selecTedCategory: categories));
  }

  Future<void> getFavorites() async {
    final response = await _fetchAllStatusEventsAttendeesUsecase('SAVED');
    response.fold(setError, (result) {
      update(state.copyWith(attendees: result));
    });
  }

  Future<void> fetchEvents() async {
    setLoading(true);
    final response = await _fetchAllEventsUsecase();
    response.fold(setError, (result) {
      List<EventDescriptionEntity> promoted = [];
      List<EventDescriptionEntity> online = [];
      for (var element in result) {
        if (element.isPromoted) {
          promoted.add(element);
        }
        if (element.isOnline) {
          online.add(element);
        }
      }
      update(state.copyWith(
          events: result, promotedEvents: promoted, onlineEvents: online));
    });
    setLoading(false);
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

  Future<void> userDrivenEvents() async {
    setLoading(true);
    final reponse = await _fetchUserEventsUsecase();
    reponse.fold(setError, (response) {
      update(state.copyWith(userDrivenEventsList: response));
    });
    setLoading(false);
  }

  Future<void> fetchTips() async {
    setLoading(true);
    final response = await _fetchTipsUsecase();
    response.fold(setError, (response) {
      update(state.copyWith(tipsList: response));
    });
    setLoading(false);
  }
}

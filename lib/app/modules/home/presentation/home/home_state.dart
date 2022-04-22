import 'package:camp_final/app/modules/home/domain/entities/wellness_entity.dart';
import "../../domain/entities/attendees_response_entity.dart";
import '../../domain/entities/event_description_entity.dart';
import '../../domain/entities/mood_entity.dart';

class HomeState {
  final List<EventDescriptionEntity> events;
  final List<EventDescriptionEntity> promotedEvents;
  final List<EventDescriptionEntity> onlineEvents;
  final List<EventDescriptionEntity> userDrivenEventsList;
  final List<AttendeesReponseEntity> attendees;
  final List<MoodEntity> moods;
  final MoodEntity? selectedMood;
  final bool showMood;
  final List<WellnessEntity> tipsList;

  HomeState({
    required this.events,
    required this.promotedEvents,
    required this.attendees,
    required this.moods,
    required this.selectedMood,
    required this.showMood,
    required this.userDrivenEventsList,
    required this.onlineEvents,
    required this.tipsList,
  });

  HomeState copyWith({
    List<EventDescriptionEntity>? events,
    List<EventDescriptionEntity>? promotedEvents,
    List<EventDescriptionEntity>? onlineEvents,
    List<EventDescriptionEntity>? userDrivenEventsList,
    List<AttendeesReponseEntity>? attendees,
    List<MoodEntity>? moods,
    MoodEntity? selectedMood,
    bool? showMood,
    List<WellnessEntity>? tipsList,
  }) {
    return HomeState(
      events: events ?? this.events,
      promotedEvents: promotedEvents ?? this.promotedEvents,
      onlineEvents: onlineEvents ?? this.onlineEvents,
      userDrivenEventsList: userDrivenEventsList ?? this.userDrivenEventsList,
      attendees: attendees ?? this.attendees,
      moods: moods ?? this.moods,
      selectedMood: selectedMood ?? this.selectedMood,
      showMood: showMood ?? this.showMood,
      tipsList: tipsList ?? this.tipsList,
    );
  }
}

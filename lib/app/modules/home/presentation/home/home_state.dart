import 'package:camp_final/app/modules/home/domain/entities/attendees_response_entity.dart';

import '../../domain/entities/event_description_entity.dart';

class HomeState {
  final List<EventDescriptionEntity> events;
  final List<EventDescriptionEntity> promotedEvents;
  final List<AttendeesReponseEntity> attendees;

  HomeState({
    required this.events,
    required this.promotedEvents,
    required this.attendees,
  });

  HomeState copyWith({
    List<EventDescriptionEntity>? events,
    List<EventDescriptionEntity>? promotedEvents,
    List<AttendeesReponseEntity>? attendees,
  }) {
    return HomeState(
      events: events ?? this.events,
      promotedEvents: promotedEvents ?? this.promotedEvents,
      attendees: attendees ?? this.attendees,
    );
  }
}

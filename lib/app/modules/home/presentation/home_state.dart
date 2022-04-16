import '../domain/entities/event_description_entity.dart';

class HomeState {
  final List<EventDescriptionEntity> events;
  final List<EventDescriptionEntity> promotedEvents;
  HomeState({
    required this.events,
    required this.promotedEvents,
  });

  HomeState copyWith({
    List<EventDescriptionEntity>? events,
    List<EventDescriptionEntity>? promotedEvents,
  }) {
    return HomeState(
      events: events ?? this.events,
      promotedEvents: promotedEvents ?? this.promotedEvents,
    );
  }
}

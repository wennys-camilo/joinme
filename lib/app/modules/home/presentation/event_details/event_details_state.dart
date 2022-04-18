import '../../domain/entities/attendees_response_entity.dart';

class EventDetailsState {
  final bool? isFavorite;
  final List<AttendeesReponseEntity> favorites;
  EventDetailsState({
    this.isFavorite,
    required this.favorites,
  });

  EventDetailsState copyWith({
    bool? isFavorite,
    List<AttendeesReponseEntity>? favorites,
  }) {
    return EventDetailsState(
      isFavorite: isFavorite ?? this.isFavorite,
      favorites: favorites ?? this.favorites,
    );
  }
}

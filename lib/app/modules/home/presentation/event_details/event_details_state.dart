import '../../domain/entities/attendees_response_entity.dart';

class EventDetailsState {
  final bool? isFavorite;
  final List<AttendeesReponseEntity> favorites;
  final bool? isConfirmed;
  final List<AttendeesReponseEntity> confirmeds;
  EventDetailsState({
    this.isFavorite,
    required this.favorites,
    this.isConfirmed,
    required this.confirmeds,
  });

  EventDetailsState copyWith({
    bool? isFavorite,
    List<AttendeesReponseEntity>? favorites,
    bool? isConfirmed,
    List<AttendeesReponseEntity>? confirmeds,
  }) {
    return EventDetailsState(
      isFavorite: isFavorite ?? this.isFavorite,
      favorites: favorites ?? this.favorites,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      confirmeds: confirmeds ?? this.confirmeds,
    );
  }
}

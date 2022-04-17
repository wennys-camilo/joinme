class EventDetailsState {
  final bool? isFavorite;
  EventDetailsState({
    this.isFavorite,
  });

  EventDetailsState copyWith({
    bool? isFavorite,
  }) {
    return EventDetailsState(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

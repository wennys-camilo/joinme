class OnboardState {
  final bool firstAcess;
  OnboardState({required this.firstAcess});

  OnboardState copyWith({bool? firstAcess}) {
    return OnboardState(
      firstAcess: firstAcess ?? this.firstAcess,
    );
  }
}

class ForgotPasswordState {
  final String email;
  ForgotPasswordState({
    required this.email,
  });

  ForgotPasswordState copyWith({
    String? email,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
    );
  }
}

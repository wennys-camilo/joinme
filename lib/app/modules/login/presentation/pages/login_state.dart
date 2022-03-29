class LoginState {
  final String email;
  final String password;
  LoginState({
    required this.email,
    required this.password,
  });

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class LoginState {
  final String email;
  final String password;
  final bool obscurePass;
  final bool rememberMe;
  LoginState({
    required this.email,
    required this.password,
    required this.obscurePass,
    required this.rememberMe,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? obscurePass,
    bool? rememberMe,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePass: obscurePass ?? this.obscurePass,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

import 'teste.dart';

class AddEventState {
  final int isPetFriendly;
  final List<Teste> teste;
  AddEventState({
    required this.isPetFriendly,
    required this.teste,
  });

  AddEventState copyWith({
    int? isPetFriendly,
    List<Teste>? teste,
  }) {
    return AddEventState(
      isPetFriendly: isPetFriendly ?? this.isPetFriendly,
      teste: teste ?? this.teste,
    );
  }
}

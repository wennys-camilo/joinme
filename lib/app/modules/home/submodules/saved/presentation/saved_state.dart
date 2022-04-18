import 'package:camp_final/app/modules/home/domain/entities/attendees_response_entity.dart';

class SavedState {
  final List<AttendeesReponseEntity> attendes;

  SavedState({
    required this.attendes,
  });

  SavedState copyWith({
    List<AttendeesReponseEntity>? attendes,
  }) {
    return SavedState(
      attendes: attendes ?? this.attendes,
    );
  }
}

import '../../domain/enums/mood_type.dart';

class MoodTypeMapper {
  MoodType to(String value) {
    switch (value) {
      case "Feliz":
        return MoodType.happy;

      case "Triste":
        return MoodType.sad;

      case "Entediado":
        return MoodType.bored;

      case "Muito Feliz":
        return MoodType.motivated;

      case "Neutro":
        return MoodType.neutral;

      default:
        return MoodType.happy;
    }
  }
}

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

      case "Motivado":
        return MoodType.motivated;

      default:
        throw UnimplementedError();
    }
  }
}

import '../../../domain/enums/mood_type.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';

extension MoodTypeExtension on MoodType {
  String get moodIcon {
    switch (this) {
      case MoodType.happy:
        return AppTheme.images.happy;

      case MoodType.sad:
        return AppTheme.images.sad;

      case MoodType.bored:
        return AppTheme.images.bored;

      case MoodType.motivated:
        return AppTheme.images.motivated;

      default:
        throw UnimplementedError();
    }
  }

  String get selectedIcon {
    switch (this) {
      case MoodType.happy:
        return AppTheme.images.happySelected;

      case MoodType.sad:
        return AppTheme.images.sadSelected;

      case MoodType.bored:
        return AppTheme.images.boredSelected;

      case MoodType.motivated:
        return AppTheme.images.motivatedSelected;

      default:
        throw UnimplementedError();
    }
  }
}

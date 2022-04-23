import '../../../domain/enums/category_type.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';

extension CategoryTypeExtension on CategorieType {
  String get coverPhoto {
    switch (this) {
      case CategorieType.yoga:
        return AppTheme.images.yoga;

      case CategorieType.football:
        return AppTheme.images.footbal;

      case CategorieType.volleyball:
        return AppTheme.images.volleyball;

      case CategorieType.race:
        return AppTheme.images.race;

      case CategorieType.meditation:
        return AppTheme.images.meditation;

      case CategorieType.music:
        return AppTheme.images.music;

      case CategorieType.art:
        return AppTheme.images.art;

      case CategorieType.movie:
        return AppTheme.images.movie;

      case CategorieType.gym:
        return AppTheme.images.gym;

      case CategorieType.games:
        return AppTheme.images.games;

      case CategorieType.studies:
        return AppTheme.images.studies;

      case CategorieType.technology:
        return AppTheme.images.technology;

      default:
        return AppTheme.images.music;
    }
  }
}

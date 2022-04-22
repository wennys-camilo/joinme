import 'app_icons.dart';
import 'app_images.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  static AppColors get colors => AppColorsImpl();
  static AppImages get images => AppImagesImpl();
  static AppIcons get icons => AppIconsImpl();
}

import 'package:camp_final/app/modules/home/domain/enums/mood_type.dart';

class MoodEntity {
  final String id;
  final String name;
  final String activate;
  final MoodType typeIcon;
  MoodEntity({
    required this.id,
    required this.name,
    required this.activate,
    required this.typeIcon,
  });
}

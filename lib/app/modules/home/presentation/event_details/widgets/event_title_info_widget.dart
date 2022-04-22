import 'package:flutter/material.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';

class EventTitleInfoWidget extends StatelessWidget {
  final String titleInfo;
  const EventTitleInfoWidget({
    Key? key,
    required this.titleInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleInfo,
      style: TextStyle(
          color: AppTheme.colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }
}

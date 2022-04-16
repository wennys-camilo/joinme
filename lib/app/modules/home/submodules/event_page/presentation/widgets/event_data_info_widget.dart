import 'package:flutter/material.dart';

import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';

class EventDataInfoWidget extends StatelessWidget {
  final String titleData;
  const EventDataInfoWidget({
    Key? key,
    required this.titleData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleData,
      style: TextStyle(
          color: AppTheme.colors.black.withOpacity(0.5),
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}


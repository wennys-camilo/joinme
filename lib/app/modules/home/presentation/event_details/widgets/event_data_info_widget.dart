import 'package:flutter/material.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';

class EventDataInfoWidget extends StatelessWidget {
  final String titleData;
  final bool boldFont;
  const EventDataInfoWidget({
    Key? key,
    required this.titleData,
    this.boldFont = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleData,
      style: TextStyle(
          color: AppTheme.colors.black,
          fontSize: 16,
          fontWeight: boldFont ? FontWeight.bold : FontWeight.normal),
    );
  }
}

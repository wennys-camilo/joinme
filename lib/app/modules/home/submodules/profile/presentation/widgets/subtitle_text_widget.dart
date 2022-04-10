import 'package:flutter/material.dart';

import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';

class SubtitleText extends StatelessWidget {
  final String subtitle;
  const SubtitleText({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(color: AppTheme.colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w700 ),
    );
  }
}

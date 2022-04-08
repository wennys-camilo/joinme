import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class SectionLabelTitleWidget extends StatelessWidget {
  final String titleSection;
  final void Function()? onPressed;
  const SectionLabelTitleWidget(
      {Key? key, required this.titleSection, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleSection,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.colors.black.withOpacity(0.5)),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'Ver todos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

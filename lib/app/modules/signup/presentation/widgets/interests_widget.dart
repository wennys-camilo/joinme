import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class InterestWidget extends StatelessWidget {
  final bool selected;
  final String name;
  const InterestWidget({Key? key, required this.selected, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: selected ? AppTheme.colors.primary : AppTheme.colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(name)
      ],
    );
  }
}

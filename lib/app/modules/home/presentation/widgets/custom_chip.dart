import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class CustomChip extends StatelessWidget {
  final String label;

  final Color? color;
  const CustomChip({Key? key, required this.label, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        constraints: const BoxConstraints(minWidth: 50),
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: Border.all(color: AppTheme.colors.black, width: 1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}

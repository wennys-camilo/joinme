import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class CustomFilterChipWidget extends StatelessWidget {
  final Color chipColor;
  final String label;
  final bool selected;
  final Color? backgroundColor;
  final Color? selectedColor;
  final void Function(bool)? onSelected;
  final Color? colorText;
  const CustomFilterChipWidget({
    Key? key,
    required this.chipColor,
    required this.label,
    required this.onSelected,
    required this.selected,
    this.backgroundColor,
    this.selectedColor,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: FilterChip(
        backgroundColor: backgroundColor ?? AppTheme.colors.transparent,
        selectedColor: selectedColor,
        side: BorderSide(color: chipColor, width: 2),
        label: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            label,
            style: TextStyle(
                color: colorText ?? chipColor, fontWeight: FontWeight.bold),
          ),
        ),
        onSelected: onSelected,
        selected: selected,
        showCheckmark: false,
      ),
    );
  }
}

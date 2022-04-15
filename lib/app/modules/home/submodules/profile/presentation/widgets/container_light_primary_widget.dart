import 'package:flutter/material.dart';
import '../../../../../../shared/presentation/themes/app_theme.dart';

class ContainerLightPrimary extends StatelessWidget {
  final Widget superiorIcon;
  final String inferior;
  const ContainerLightPrimary({
    Key? key,
    required this.superiorIcon,
    required this.inferior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          superiorIcon,
          Text(
            inferior,
            style: TextStyle(
                color: AppTheme.colors.black.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      width: 99,
      height: 70,
      decoration: BoxDecoration(
          color: AppTheme.colors.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}

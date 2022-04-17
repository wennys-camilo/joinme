import 'package:flutter/material.dart';
import '../../../../../../shared/presentation/themes/app_theme.dart';

class ContainerLightPrimary extends StatelessWidget {
  final Widget topComponent;
  final String bottomText;
  const ContainerLightPrimary({
    Key? key,
    required this.topComponent,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          topComponent,
          Text(
            bottomText,
            style: TextStyle(
                color: AppTheme.colors.black.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      height: 70,
      decoration: BoxDecoration(
          color: AppTheme.colors.greyLight,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}

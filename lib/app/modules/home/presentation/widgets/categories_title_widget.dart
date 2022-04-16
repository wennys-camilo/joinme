import 'package:flutter/material.dart';
import '../../../../shared/presentation/themes/app_theme.dart';

class CategoriesTitleWidget extends StatelessWidget {
  final String title;
  const CategoriesTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: AppTheme.colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

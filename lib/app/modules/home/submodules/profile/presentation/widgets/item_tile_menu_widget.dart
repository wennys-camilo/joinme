import '../../../../../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTileMenuWidget extends StatelessWidget {
  final String icon;
  final String title;
  const ItemTileMenuWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset(
          icon,
          color: AppTheme.colors.primary,
        ),
        backgroundColor: AppTheme.colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: AppTheme.colors.neutralDark,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

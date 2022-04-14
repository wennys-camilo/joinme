import 'package:flutter/material.dart';

import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';

class Event_List_View_categories extends StatelessWidget {
  final Color chipColor;
  const Event_List_View_categories({
    Key? key,
    required this.chipColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              backgroundColor: AppTheme.colors.transparent,
              side: BorderSide(color: chipColor),
              label: Text(
                'categorias',
                style: TextStyle(color: chipColor),
              ),
              onSelected: (b) {},
            ),
          );
        });
  }
}

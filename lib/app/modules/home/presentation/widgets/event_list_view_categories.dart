import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class EventListViewcategories extends StatelessWidget {
  final Color chipColor;
  const EventListViewcategories({
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
              label: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Categorias',
                  style:
                      TextStyle(color: chipColor, fontWeight: FontWeight.bold),
                ),
              ),
              onSelected: (b) {},
            ),
          );
        });
  }
}

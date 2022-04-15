import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';

class InsightsHorizontalGridView extends StatelessWidget {
  final String title;
  final String description;
  const InsightsHorizontalGridView({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 160 / 168, crossAxisCount: 1, mainAxisSpacing: 4),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() {
            Modular.to.pushNamed('./eventPage');
          }),
          child: Card(
              clipBehavior: Clip.antiAlias,
              color: AppTheme.colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    height: 115,
                    width: 168,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: AppTheme.colors.black.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(description,
                            style: TextStyle(
                                color: AppTheme.colors.black.withOpacity(0.6),
                                fontSize: 11,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

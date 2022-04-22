import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class InsightsHorizontalGridView extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const InsightsHorizontalGridView({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        color: AppTheme.colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 168,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
                fit: BoxFit.cover,
              ),
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
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      description,
                      style: TextStyle(
                        color: AppTheme.colors.black.withOpacity(0.6),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../home_page.dart';

class HorizontalGridView extends StatefulWidget {
  final String events;
  const HorizontalGridView({
    Key? key,
    required this.events,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  State<HorizontalGridView> createState() => _LargeHorizontalGridViewState();
}

class _LargeHorizontalGridViewState extends State<HorizontalGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 158 / 114, crossAxisCount: 1, mainAxisSpacing: 4),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: AppTheme.colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.events,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.colors.primary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../shared/presentation/themes/app_theme.dart';

class StepsOnboardingWidget extends StatelessWidget {
  final int numPage;

  const StepsOnboardingWidget({Key? key, required this.numPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (int index) => Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              width: 20,
              height: 15,
              decoration: BoxDecoration(
                  color: numPage == index
                      ? AppTheme.colors.primary
                      : AppTheme.colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}

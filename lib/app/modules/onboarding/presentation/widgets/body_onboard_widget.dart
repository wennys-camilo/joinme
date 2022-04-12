import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import 'steps_onboard_widget.dart';

class BodyOnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int numBoard;
  final void Function()? onPressed;

  const BodyOnboardingWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onPressed,
    required this.numBoard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.greyBoard,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(image),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    title,
                    style:
                        TextStyle(color: AppTheme.colors.primary, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                        color: AppTheme.colors.black.withOpacity(0.6),
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                StepsOnboardingWidget(
                  numPage: numBoard,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButtonWidget(
                  onPressed: onPressed,
                  textButton: 'Proximo',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

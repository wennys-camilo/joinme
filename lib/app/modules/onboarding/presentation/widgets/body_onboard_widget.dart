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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height * 0.5,
                child: SvgPicture.asset(image),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  subtitle,
                  style: TextStyle(color: AppTheme.colors.black, fontSize: 15),
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
                textButton: 'PRÓXIMO',
                width: MediaQuery.of(context).size.width * 0.85,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

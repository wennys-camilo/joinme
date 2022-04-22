import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import 'widgets/body_onboard_widget.dart';

class OnboardPageTwo extends StatelessWidget {
  const OnboardPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyOnboardingWidget(
      title:
          '...já pensou quantas pessoas ao seu redor podem estar se sentindo assim?',
      subtitle:
          'Que tal se conectar com elas participando de grupos ou eventos do seu interesse?',
      image: AppTheme.images.boardTwo,
      onPressed: () => Modular.to.navigate('/board3'),
      numBoard: 1,
    );
  }
}

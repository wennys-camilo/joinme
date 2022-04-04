import '../../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'widgets/body_onboard_widget.dart';

class OnboardPageOne extends StatelessWidget {
  const OnboardPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyOnboardingWidget(
      title:
          'Dia difícil? Encontre atividades para aliviar a tensão próximas a você...',
      subtitle:
          'Que tal esquecer e relaxar um pouco participando de grupos ou eventos que gosta?',
      image: AppTheme.images.boardOne,
      onPressed: () => Modular.to.navigate('/board2'),
      numBoard: 0,
    );
  }
}

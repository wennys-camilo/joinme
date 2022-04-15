import '../../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'widgets/body_onboard_widget.dart';

class OnboardPageOne extends StatelessWidget {
  const OnboardPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyOnboardingWidget(
      title: 'A gente entende como alguns dias podem ser bem estressantes...',
      subtitle:
          'Mas sabia que às vezes é mais produtivo fazer uma pausa e relaxar um pouco?',
      image: AppTheme.images.boardOne,
      onPressed: () => Modular.to.navigate('/board2'),
      numBoard: 0,
    );
  }
}

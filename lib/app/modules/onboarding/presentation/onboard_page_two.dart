import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/presentation/themes/app_theme.dart';
import 'widgets/body_onboard_widget.dart';

class OnboardPageTwo extends StatelessWidget {
  const OnboardPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyOnboardingWidget(
      title: '...se conecte com pessoas que dividem os mesmos interesses...',
      subtitle:
          'Já pensou em quantas pessoas podem estar procurando atividades parecidas?',
      image: AppTheme.images.boardTwo,
      onPressed: () => Modular.to.navigate('/board3'),
      numBoard: 1,
    );
  }
}

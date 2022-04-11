import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import 'widgets/body_onboard_widget.dart';

class OnboardPageThree extends StatelessWidget {
  const OnboardPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyOnboardingWidget(
      title:
          '... e não deixe de cuidar da sua sáude mental e física. Às vezes só precisamos de um pouco de incentivo, não é mesmo? ',
      subtitle:
          'Não seria legal aproveitar melhor o seu tempo livre e ter uma rotina mais agradável?',
      image: AppTheme.images.boardThree,
      onPressed: () => Modular.to.navigate('/login/'),
      numBoard: 2,
    );
  }
}

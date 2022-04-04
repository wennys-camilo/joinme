import 'onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/presentation/themes/app_theme.dart';

class OnboardPageVerify extends StatefulWidget {
  const OnboardPageVerify({Key? key}) : super(key: key);

  @override
  State<OnboardPageVerify> createState() => _OnboardPageVerifyState();
}

class _OnboardPageVerifyState extends State<OnboardPageVerify> {
  OnboardController controller = Modular.get<OnboardController>();

  @override
  void initState() {
    super.initState();
    controller.observer(
      onState: (state) {
        if (state.firstAcess) {
          Modular.to.navigate('/board1');
          controller.setAcess(true);
        } else {
          Modular.to.navigate('/login/');
        }
      },
    );
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 6,
          margin: const EdgeInsets.fromLTRB(100, 20, 100, 70),
          decoration: BoxDecoration(
            color: AppTheme.colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
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
    //loadPictures();
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

  loadPictures() {
    Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
            AppTheme.images.boardOne),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
            AppTheme.images.boardTwo),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
            AppTheme.images.boardThree),
        null,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Lottie.asset('assets/images/splash.json'),
        ),
      ),
    );
  }
}

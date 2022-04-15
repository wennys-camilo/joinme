import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';

class SignupConfirmationPage extends StatefulWidget {
  const SignupConfirmationPage({Key? key}) : super(key: key);

  @override
  State<SignupConfirmationPage> createState() => _SignupConfirmationPageState();
}

class _SignupConfirmationPageState extends State<SignupConfirmationPage> {
  @override
  void initState() {
    super.initState();
    preChacheSvg();
  }

  preChacheSvg() {
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder, // See UPDATE below!
        AppTheme.images.confirmation,
      ),
      null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              AppTheme.images.confirmation,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Que bom  ter você por aqui!',
            style: TextStyle(
              color: AppTheme.colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Sua conta foi criada com sucesso!',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          RoundedButtonWidget(
            width: MediaQuery.of(context).size.width * 0.8,
            onPressed: () => Modular.to.navigate('/signup/phaseTwo'),
            textButton: 'ENTRAR',
          )
        ],
      ),
    );
  }
}

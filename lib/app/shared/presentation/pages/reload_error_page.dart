import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import '../widgets/rounded_button_widget.dart';

class ReloadErrorPage extends StatelessWidget {
  final String message;
  final void Function()? action;
  const ReloadErrorPage({Key? key, required this.message, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: AppTheme.colors.primary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                onPressed: action,
                textButton: 'Tentar Novamente',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String? textButton;
  final void Function()? onPressed;
  const RoundedButtonWidget(
      {Key? key, this.textButton, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 35,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppTheme.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Text(
          textButton ?? '',
          style: TextStyle(color: AppTheme.colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String? textButton;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? styleText;
  const RoundedButtonWidget(
      {Key? key,
      this.textButton,
      required this.onPressed,
      this.backgroundColor,
      this.styleText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Text(
          textButton ?? '',
          style: styleText ?? TextStyle(color: AppTheme.colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

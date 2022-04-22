import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/app_theme.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String? textButton;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? styleText;
  final double? width;
  final bool googleButton;
  const RoundedButtonWidget({
    Key? key,
    this.textButton,
    required this.onPressed,
    this.backgroundColor,
    this.styleText,
    this.width,
    this.googleButton = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.5,
      height: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textButton ?? '',
              style: styleText ??
                  TextStyle(
                      color: AppTheme.colors.white,
                      fontWeight: FontWeight.bold),
            ),
            googleButton
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(AppTheme.images.googleIcon),
                  )
                : Container()
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/app_theme.dart';

class InputTextWidget extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;

  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final double? height;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? suffixText;
  final String? prefixText;
  final String? labelText;

  final EdgeInsetsGeometry? paddding;
  const InputTextWidget({
    Key? key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.height,
    this.maxLines = 1,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.labelText,
    this.paddding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddding ?? const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: SizedBox(
        height: height,
        child: TextFormField(
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            suffixText: suffixText,
            hintText: hintText,
            prefixText: prefixText,
            labelText: labelText,
            contentPadding: const EdgeInsets.all(18.0),
            hintStyle: TextStyle(color: AppTheme.colors.grey.withOpacity(0.8)),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}

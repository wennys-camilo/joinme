import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class InputTextWidget extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final String? ontopHint;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const InputTextWidget({
    Key? key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.ontopHint,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ontopHint ?? '',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.all(23.0),
              hintStyle:
                  TextStyle(color: AppTheme.colors.grey.withOpacity(0.8)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                    width: 1, color: AppTheme.colors.grey.withOpacity(0.7)),
              ),
              suffixIcon: suffixIcon,
            ),
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}

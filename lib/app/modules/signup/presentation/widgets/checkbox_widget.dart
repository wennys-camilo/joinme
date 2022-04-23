import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../shared/presentation/themes/app_theme.dart';

class CheckboxWidget extends StatefulWidget {
  final void Function(bool?) onChanged;
  final bool initialValue;
  final String? Function(bool?)? validator;
  const CheckboxWidget({
    Key? key,
    required this.onChanged,
    this.initialValue = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late final ValueNotifier<bool?> _isCheck;

  void _changeCheck(bool? value) {
    _isCheck.value = value;
    widget.onChanged.call(value);
  }

  @override
  void initState() {
    super.initState();
    _isCheck = ValueNotifier<bool?>(widget.initialValue);
  }

  @override
  void dispose() {
    super.dispose();
    _isCheck.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool?>(
      valueListenable: _isCheck,
      builder: (context, value, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            checkboxTheme: CheckboxThemeData(
              side: MaterialStateBorderSide.resolveWith(
                  (_) => const BorderSide(width: 0.60)),
            ),
          ),
          child: FormBuilderCheckbox(
            name: 'accept_terms',
            initialValue: value,
            onChanged: _changeCheck,
            checkColor: AppTheme.colors.white,
            activeColor: AppTheme.colors.primary,
            title: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Li e concordo com os',
                style: TextStyle(fontSize: 16, color: AppTheme.colors.black),
                children: [
                  TextSpan(
                    text: ' Termos e Condições e Politica de Privacidade',
                    style: TextStyle(
                      color: AppTheme.colors.primary,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            validator: widget.validator,
          ),
        );
      },
    );
  }
}

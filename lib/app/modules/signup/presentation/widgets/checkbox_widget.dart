import 'package:flutter/material.dart';
import '../../../../shared/presentation/themes/app_theme.dart';

class CheckboxWidget extends StatefulWidget {
  final void Function(bool?) onChanged;
  final bool initialValue;

  const CheckboxWidget(
      {Key? key, required this.onChanged, this.initialValue = false})
      : super(key: key);

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
      builder: (context, value, widget) {
        return Checkbox(
          value: value,
          onChanged: _changeCheck,
          side: const BorderSide(width: 0.25),
          checkColor: AppTheme.colors.white,
          activeColor: AppTheme.colors.primary,
        );
      },
    );
  }
}

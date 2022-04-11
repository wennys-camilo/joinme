import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String? titulo;
  final List<DropdownMenuItem<dynamic>>? items;

  final String? labelText;
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onSaved;
  final TextStyle? labelStyle;

  const DropDownWidget({
    Key? key,
    this.titulo,
    this.onSaved,
    this.items,
    this.labelText,
    this.value,
    this.validator,
    this.onChanged,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: DropdownButtonFormField<dynamic>(
        value: value,
        items: items,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          contentPadding: const EdgeInsets.all(16.0),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

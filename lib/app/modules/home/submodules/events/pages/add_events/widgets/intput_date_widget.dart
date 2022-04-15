import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class InputDateWidget extends StatelessWidget {
  final void Function(DateTime?)? onChanged;
  final String? labelText;
  final String? Function(DateTime?)? validator;

  const InputDateWidget(
      {Key? key, this.onChanged, this.labelText, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: FormBuilderDateTimePicker(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        name: 'date',
        format: DateFormat(" d 'de' MMMM 'de' y", "pt_BR"),
        onChanged: onChanged,
        inputType: InputType.date,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: const Icon(Icons.calendar_month),
          contentPadding: const EdgeInsets.all(18.0),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}

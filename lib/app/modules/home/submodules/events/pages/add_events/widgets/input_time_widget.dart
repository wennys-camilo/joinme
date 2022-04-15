import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputTimeWidget extends StatelessWidget {
  final void Function(DateTime?)? onChanged;
  final String? Function(DateTime?)? validator;
  final String? labelText;
  const InputTimeWidget(
      {Key? key, this.onChanged, this.validator, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: FormBuilderDateTimePicker(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        name: 'time',
        initialTime: const TimeOfDay(hour: 8, minute: 0),
        onChanged: onChanged,
        inputType: InputType.time,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: const Icon(Icons.access_time),
          contentPadding: const EdgeInsets.all(18.0),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}

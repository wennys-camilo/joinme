import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../../../shared/presentation/themes/app_theme.dart';

class InputTimeWidget extends StatelessWidget {
  final String? onTopHint;
  final void Function(DateTime?)? onChanged;
  const InputTimeWidget({Key? key, this.onTopHint, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            onTopHint ?? '',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          FormBuilderDateTimePicker(
            name: 'time',
            initialTime: const TimeOfDay(hour: 8, minute: 0),
            onChanged: onChanged,
            inputType: InputType.time,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.access_time),
              contentPadding: const EdgeInsets.all(23.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  width: 1,
                  color: AppTheme.colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            // enabled: true,
          ),
        ],
      ),
    );
  }
}

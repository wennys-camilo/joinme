import 'package:flutter/material.dart';
import '../../../../../../../shared/presentation/themes/app_theme.dart';

class DropDownWidget extends StatelessWidget {
  final String? titulo;
  final List<DropdownMenuItem<dynamic>>? items;
  final String? onTopHint;
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
    this.onTopHint,
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
          DropdownButtonFormField<dynamic>(
            items: items,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelStyle,
              contentPadding: const EdgeInsets.all(20.0),
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
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}

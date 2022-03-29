import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String? hintText;
  const InputTextWidget({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

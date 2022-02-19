import 'package:flutter/material.dart';
import 'package:moim_app/components/stateful_text_field.dart';
import 'package:moim_app/components/text_field_container.dart';

import '../design_system.dart';

enum RoundedInputFieldType { text, password }

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Color color;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final RoundedInputFieldType type;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.type = RoundedInputFieldType.text,
    this.color = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: StatefulTextField(
          type: type,
          onChanged: onChanged,
          icon: icon,
          color: color,
          hintText: hintText),
    );
  }
}

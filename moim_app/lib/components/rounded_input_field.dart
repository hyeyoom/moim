import 'package:flutter/material.dart';
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
      child: TextField(
        obscureText: type == RoundedInputFieldType.password,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: type == RoundedInputFieldType.password ? const Icon(Icons.visibility) : null
        ),
      ),
    );
  }
}

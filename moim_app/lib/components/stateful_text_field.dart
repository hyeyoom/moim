import 'package:flutter/material.dart';
import 'package:moim_app/components/rounded_input_field.dart';

class StatefulTextField extends StatefulWidget {
  final RoundedInputFieldType type;
  final ValueChanged<String> onChanged;
  final IconData icon;
  final Color color;
  final String hintText;

  const StatefulTextField({
    Key? key,
    required this.type,
    required this.onChanged,
    required this.icon,
    required this.color,
    required this.hintText,
  }) : super(key: key);

  @override
  _StatefulTextFieldState createState() => _StatefulTextFieldState();
}

class _StatefulTextFieldState extends State<StatefulTextField> {

  bool visible = true;


  @override
  void initState() {
    super.initState();
    setState(() {
      visible = widget.type != RoundedInputFieldType.password;
    });
  }

  void markAsVisible() {
    setState(() {
      visible = true;
    });
  }
  void markAsInvisible() {
    setState(() {
      visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.type == RoundedInputFieldType.password && !visible,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: widget.color,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: widget.type != RoundedInputFieldType.password
              ? null
              : !visible
              ? IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: markAsVisible,
          )
              : IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: markAsInvisible,
          )),
    );
  }
}

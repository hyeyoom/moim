import 'package:flutter/material.dart';
import 'package:moim_app/design_system.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = primaryColor,
    this.textColor = primaryWeakColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

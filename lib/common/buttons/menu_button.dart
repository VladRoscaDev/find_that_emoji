import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String message;
  final VoidCallback callBackFunction;
  final Color buttonColor;
  final Color textColor;
  const MenuButton({
    super.key,
    required this.message,
    required this.callBackFunction,
    this.buttonColor = Colors.indigo,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      height: context.height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: callBackFunction,
        child: Text(
          message,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

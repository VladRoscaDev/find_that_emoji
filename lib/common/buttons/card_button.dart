import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String message;
  final Icon icon;
  final VoidCallback callBackFunction;
  final Color buttonColor;
  final Color textColor;
  const CardButton(
      {super.key,
      required this.message,
      required this.icon,
      required this.callBackFunction,
      this.buttonColor = Colors.indigo,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.45,
      height: context.height * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: buttonColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: callBackFunction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double elevation;
  final Widget image;
  final String textToDisplay;
  final double borderRadius;

  const CustomCard(
      {super.key,
      this.elevation = 5,
      required this.image,
      required this.textToDisplay,
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.height * 0.5,
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              image,
              SizedBox(
                height: context.height * 0.05,
              ),
              DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [WavyAnimatedText(textToDisplay)],
                    isRepeatingAnimation: true,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

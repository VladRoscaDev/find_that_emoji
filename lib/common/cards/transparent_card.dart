import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TransparentCard extends StatelessWidget {
  final double elevation;
  final Widget component;
  final double borderRadius;

  const TransparentCard(
      {super.key,
      this.elevation = 5,
      required this.component,
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.height * 0.8,
      child: Card(
        color: Colors.black38,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: component,
        ),
      ),
    );
  }
}

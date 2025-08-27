import 'package:flutter/material.dart';

class ResponsiveTitle extends StatelessWidget {
  final String text;
  final double maxFontSize;
  final double minFontSize;

  const ResponsiveTitle(
      this.text, {
        super.key,
        this.maxFontSize = 60,
        this.minFontSize = 20,
      });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final fontSize = (width * 0.06).clamp(minFontSize, maxFontSize);

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'SpongeBoy',
      ),
    );
  }
}

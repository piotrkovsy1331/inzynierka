import 'package:flutter/material.dart';

class GradientHorizontalDivider extends StatelessWidget {
  const GradientHorizontalDivider({
    Key? key,
    required this.gradientColor,
  }) : super(key: key);

  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      child: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: gradientColor)),
      ),
    );
  }
}

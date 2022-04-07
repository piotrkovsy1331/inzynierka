import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    Key? key,
    required this.property,
    required this.value,
  }) : super(key: key);
  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: property,
            style: Theme.of(context).textTheme.headline6,
            children: [
          const TextSpan(text: '    '),
          TextSpan(text: value, style: Theme.of(context).textTheme.headline5)
        ]));
  }
}

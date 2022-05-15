import 'package:flutter/material.dart';

class ApiProductQuantityText extends StatelessWidget {
  const ApiProductQuantityText({
    Key? key,
    required this.quantity,
    required this.value,
  }) : super(key: key);
  final String quantity;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: quantity,
                style: Theme.of(context).textTheme.headline3,
                children: [
              const TextSpan(text: ':    '),
              TextSpan(
                  text: value, style: Theme.of(context).textTheme.headline3)
            ])),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 1,
        )
      ],
    );
  }
}

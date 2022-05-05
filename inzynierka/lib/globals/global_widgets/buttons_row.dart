import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
      {Key? key,
      required this.buttonText,
      required this.outlinedButtonText,
      required this.ontapButton,
      required this.onTapButttonOutlined})
      : super(key: key);
  final VoidCallback ontapButton;
  final VoidCallback onTapButttonOutlined;
  final String buttonText;
  final String outlinedButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onTapButttonOutlined,
          child: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              border: Border.all(color: Theme.of(context).disabledColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Center(
              child: Text(
                outlinedButtonText,
                style: Theme.of(context).textTheme.headline3!,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: ontapButton,
          child: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

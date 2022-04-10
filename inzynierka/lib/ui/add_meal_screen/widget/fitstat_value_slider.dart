import 'package:flutter/material.dart';

class FitstatValueSlider extends StatelessWidget {
  const FitstatValueSlider(
      {Key? key,
      required this.sliderValue,
      required this.hintText,
      required this.onValueChange,
      required this.unit,
      required this.maxValue})
      : super(key: key);

  final double sliderValue;
  final String hintText;
  final String unit;
  final double maxValue;
  final void Function(double) onValueChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 8.0), child: Text(hintText)),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Slider(
                  value: sliderValue,
                  min: 0,
                  max: maxValue,
                  onChanged: onValueChange,
                ),
              ),
              Expanded(
                flex: 2,
                child: RichText(
                    maxLines: 1,
                    text: TextSpan(
                        text: sliderValue.toInt().toString(),
                        style: Theme.of(context).textTheme.headline5,
                        children: [
                          TextSpan(
                              text: ' ' + unit,
                              style: Theme.of(context).textTheme.headline6)
                        ])),
              )
            ],
          ),
        ],
      ),
    );
  }
}

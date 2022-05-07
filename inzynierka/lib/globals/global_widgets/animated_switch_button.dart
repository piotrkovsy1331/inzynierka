import 'package:flutter/material.dart';

import '../../logics/notifiers/app_theme_notifier.dart';

class AnimatedSwitchButton extends StatefulWidget {
   AnimatedSwitchButton({Key? key, required this.themeChange})
      : super(key: key);
  AppThemeNotifier themeChange;
  @override
  State<AnimatedSwitchButton> createState() => _AnimatedSwitchButtonState();
}

class _AnimatedSwitchButtonState extends State<AnimatedSwitchButton> {
  bool isEnabled = false;

  final animationDuration = const Duration(milliseconds: 250);
  // late final AppThemeNotifier themeChange =
  //     Provider.of<AppThemeNotifier>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.themeChange.darkTheme = !widget.themeChange.darkTheme;
        setState(() {
          isEnabled = !isEnabled;
        });
      },
      child: AnimatedContainer(
        duration: animationDuration,
        // alignment: Alignment.centerRight,
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff989fd5),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: AnimatedAlign(
          alignment: isEnabled ? Alignment.centerLeft : Alignment.centerRight,
          duration: animationDuration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

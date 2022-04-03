import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';

class FitstatTextField extends StatefulWidget {
  const FitstatTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.validator,
      this.inputType = TextInputType.text})
      : super(key: key);

  /// Kontroller pola textowego
  final TextEditingController controller;

  ///Funkcja do walidacji zwracająca [String] z wiadomością błędu lub 'null', jeśli przejdzie walidację
  final String? Function(String?)? validator;

  /// Typ pola textowego ([TextInputType.visiblePassword]) dla haseł
  final TextInputType? inputType;

  /// Napis opisujący pole tekstowe
  final String label;
  @override
  State<FitstatTextField> createState() => _FitstatTextFieldState();
}

class _FitstatTextFieldState extends State<FitstatTextField> {
  late final bool _isPassword;
  bool _showPassword = false;
  AnimateIconController eyeIconController = AnimateIconController();

  @override
  void initState() {
    super.initState();
    _isPassword = widget.inputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.inputType,
      obscureText: _isPassword && !_showPassword,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
          label: Text(widget.label),
          contentPadding: const EdgeInsets.only(left: 10),
          suffixIcon: _isPassword
              ? AnimateIcons(
                  startIcon: Icons.visibility,
                  startTooltip: 'Pokaz hasło',
                  startIconColor: Colors.green[100],
                  endIcon: Icons.visibility_off,
                  endTooltip: 'Ukryj hasło',
                  endIconColor: Colors.grey[700],
                  controller: eyeIconController,
                  onStartIconPress: onIconPressed,
                  onEndIconPress: onIconPressed,
                  duration: const Duration(milliseconds: 200),
                )
              : null),
    );
  }

  bool onIconPressed() {
    setState(() {
      _showPassword = !_showPassword;
      if (eyeIconController.isStart()) {
        eyeIconController.animateToEnd;
      } else if (eyeIconController.isEnd()) {
        eyeIconController.animateToStart;
      }
    });
    return true;
  }
}

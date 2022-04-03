import 'package:flutter/material.dart';
import 'package:inzynierka/shared/style/fitstat_colors.dart';

class FitstatStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.green,
        primaryColor: isDarkTheme
            ? const Color.fromARGB(255, 121, 185, 56)
            : const Color.fromARGB(255, 109, 151, 44),
        backgroundColor: isDarkTheme
            ? FitStatColors.backroundColorDark
            : FitStatColors.backroundColor,
        indicatorColor:
            isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
        hintColor:
            isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
        highlightColor:
            isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
        hoverColor:
            isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
        focusColor:
            isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: isDarkTheme
                ? FitStatColors.primaryColor
                : FitStatColors.primaryColorDark),
        scaffoldBackgroundColor: isDarkTheme
            ? FitStatColors.backroundColorDark
            : FitStatColors.backroundColor,
        drawerTheme: DrawerThemeData(
          backgroundColor: isDarkTheme
              ? FitStatColors.backroundColorDark
              : FitStatColors.backroundColor,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              fontSize: 22,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w600),
          headline3: TextStyle(
              fontSize: 20,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
              fontSize: 16,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w300),
          bodyText2: TextStyle(
              fontSize: 14,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w300),
        ));
  }
}

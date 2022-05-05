import 'package:flutter/material.dart';
import 'package:inzynierka/shared/style/fitstat_colors.dart';

class FitstatStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        errorColor: isDarkTheme
            ? const Color.fromARGB(255, 180, 69, 86)
            : const Color.fromARGB(255, 227, 72, 96),
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
        disabledColor: isDarkTheme ? Colors.grey[500] : Colors.grey[700],
        cardColor: isDarkTheme ? Colors.grey[500] : Colors.grey[700],
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        selectedRowColor: isDarkTheme
            ? const Color.fromARGB(255, 121, 185, 56)
            : const Color.fromARGB(255, 109, 151, 44),
        unselectedWidgetColor: isDarkTheme ? Colors.grey[500] : Colors.black,
        bottomAppBarColor:
            isDarkTheme ? Colors.grey[900] : const Color(0xFFAFAFAF),
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
          headline4: TextStyle(
              fontSize: 16,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w400),
          headline5: TextStyle(
              fontSize: 13,
              color: isDarkTheme
                  ? FitStatColors.textColor
                  : FitStatColors.textColorDark,
              fontWeight: FontWeight.w400),

          /// grey text
          headline6: TextStyle(
              fontSize: 13,
              color: isDarkTheme ? Colors.grey[500] : Colors.grey[700],
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

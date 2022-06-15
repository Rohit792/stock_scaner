import 'package:flutter/material.dart';
import 'package:stock_scan_parser/utils/colors.dart';

String kFontName1 = "Manrope";

class ThemeHelper {
  ///Button with white background, black text and black border

  //Button with black background and white color

  static ThemeData applicationDarkTheme() {
    var originalTheme = ThemeData.dark();

    final colorScheme = originalTheme.colorScheme.copyWith(
      //Primary
      primary: AppColors.primaryDark,
      onPrimary: AppColors.primaryDark,

      //Primary
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.secondaryDark,
      //Error
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      /*background: ,
      onBackground: ,*/
      //Surface
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,

      tertiary: AppColors.tertiaryDark,
      onTertiary: Color.fromRGBO(41, 99, 167, 1),
    );
    final chipTheme = originalTheme.chipTheme;
    return ThemeData(
      scaffoldBackgroundColor: AppColors.surfaceDark,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorStyle: const TextStyle(color: AppColors.errorDark, fontSize: 14.0),
        errorMaxLines: 2,
      ),
      buttonTheme: originalTheme.buttonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        height: 36.0,
        minWidth: 120.0,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
        buttonColor: AppColors.primaryDark,
      ),
      textTheme: _buildTextThemeDark(originalTheme.textTheme),
      colorScheme: colorScheme,
    );
  }
}

TextTheme _buildTextThemeLight(TextTheme base) {
  final textTheme = base
      .copyWith(
        headline1: base.headline1, // Size 96, Weight Light
        headline2: base.headline2, // Size 60, Weight Light
        headline3: base.headline3, // Size 48, Weight Normal
        headline4: base.headline4, // Size 34, Weight Normal
        headline5: base.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 28), // Size 24, Weight Normal
        headline6: base.headline6, // Size 20, Weight Medium
        subtitle1: base.subtitle1!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15), // Size 15, Weight Normal
        subtitle2: base.subtitle2, // Size 14, Weight Medium
        bodyText1: base.bodyText1!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600), // Size 16, Weight Normal
        bodyText2: base.bodyText2, // Size 14, Weight Normal
        button: base.button!
            .copyWith(fontWeight: FontWeight.w600), // Size 14, Weight Medium
        caption: base.caption, // Size 12, Weight Normal
        overline: base.overline, // Size 10, Weight Normal
      )
      .apply(
        fontFamily: 'Manrope',
        displayColor: AppColors.onSecondaryDark,
        bodyColor: AppColors.surfaceDark,
      );
  //Updating button theme only cause our use case
  //textTheme.button!.copyWith(fontFamily: 'PT Sans', fontWeight: FontWeight.bold);
  return textTheme;
}

TextTheme _buildTextThemeDark(TextTheme base) {
  final textTheme = base
      .copyWith(
        headline1: base.headline1, // Size 96, Weight Light
        headline2: base.headline2, // Size 60, Weight Light
        headline3: base.headline3, // Size 48, Weight Normal
        headline4: base.headline4, // Size 34, Weight Normal
        headline5: base.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 28), // Size 24, Weight Normal
        headline6: base.headline6, // Size 20, Weight Medium
        subtitle1: base.subtitle1!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15), // Size 15, Weight Normal
        subtitle2: base.subtitle2, // Size 14, Weight Medium
        bodyText1: base.bodyText1!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600), // Size 16, Weight Normal
        bodyText2: base.bodyText2, // Size 14, Weight Normal
        button: base.button!
            .copyWith(fontWeight: FontWeight.w600), // Size 14, Weight Medium
        caption: base.caption, // Size 12, Weight Normal
        overline: base.overline, // Size 10, Weight Normal
      )
      .apply(
        fontFamily: 'Manrope',
        displayColor: AppColors.primary,
        bodyColor: AppColors.surfaceDark,
      );
  //Updating button theme only cause our use case
  //textTheme.button!.copyWith(fontFamily: 'PT Sans', fontWeight: FontWeight.bold);
  return textTheme;
}

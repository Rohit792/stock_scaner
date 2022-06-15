import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:stock_scan_parser/app/app_routes.dart';
import 'package:stock_scan_parser/features/splash/presentation/pages/splash_screen.dart';
import 'package:stock_scan_parser/generated/l10n.dart';

import 'package:stock_scan_parser/src/core/app_localizations.dart';
import 'package:stock_scan_parser/utils/theme_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // theme: AppTheme.applicationDefaultTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeHelper.applicationDarkTheme(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      onUnknownRoute: AppRoutes.onUnknownRoute,
      initialRoute: SplashScreen.routeName,
      title: 'PSL',
      // theme: ThemeData.light(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('es', 'US'),
        Locale('es', 'IN'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: const [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        S.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return null;
      },
    );
  }
}

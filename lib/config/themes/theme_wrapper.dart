import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:simawa/config/routes/route_generator.dart';
import 'package:simawa/config/translations/app_locale.dart';
import 'package:simawa/constants/route_constants.dart';

import 'app_themes.dart';

class ThemeWrapper extends StatefulWidget {
  const ThemeWrapper({Key? key}) : super(key: key);

  @override
  State<ThemeWrapper> createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends State<ThemeWrapper> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('id', AppLocale.ID),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark();
    final darkButtonTheme =
        dark.buttonTheme.copyWith(buttonColor: Colors.grey[700]);
    final darkFABTheme = dark.floatingActionButtonTheme;

    final themeCollection = ThemeCollection(themes: {
      AppThemes.lightBlue: ThemeData(primarySwatch: Colors.blue),
      AppThemes.lightRed: ThemeData(primarySwatch: Colors.red),
      AppThemes.darkBlue: dark.copyWith(
          buttonTheme: darkButtonTheme,
          floatingActionButtonTheme:
              darkFABTheme.copyWith(backgroundColor: Colors.blue),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
      AppThemes.darkRed: ThemeData.from(
          colorScheme: const ColorScheme.dark(
              primary: Colors.red, secondary: Colors.red)),
    });

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.lightBlue,
        builder: (context, theme) {
          return MaterialApp(
            supportedLocales: _localization.supportedLocales,
            localizationsDelegates: _localization.localizationsDelegates,
            title: 'Example project',
            theme: theme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: RouteConstants.loginPage,
          );
        });
  }
}

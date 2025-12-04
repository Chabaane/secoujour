import 'package:flutter/material.dart';
import 'package:project1/features/presentation/my_bloc/Home/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en', 'US'),
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,

          primary: Colors.red,
          onPrimary: Colors.white, // texte sur primary

          secondary: Colors.red,
          onSecondary: Colors.white, // texte sur secondary

          background: Colors.green,
          onBackground: Colors.red, // texte sur background

          surface: Colors.red,
          onSurface: Colors.white, // texte sur surface

          error: Colors.red,
          onError: Colors.white, // texte sur error
        ),
      ),
      home: Home(),
    );
  }
}

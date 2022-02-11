import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/src/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('th'),
      ],
      path: 'lib/assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Subject Condensed',
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

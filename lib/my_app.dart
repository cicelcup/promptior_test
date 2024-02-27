import 'package:flutter/material.dart';
import 'package:promptior_test/business/controller.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/modules/single_page.dart';
import 'package:provider/provider.dart';

///Initial widget of the app where the theme is declared.
///
/// Provider is declared to handle the state management of the app.
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: I18N.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.deepPurple, contentTextStyle: TextStyle(color: Colors.white)),
        useMaterial3: false,
      ),
      home: ChangeNotifierProvider(
        create: (_) => Controller(),
        child: const SinglePage(),
      ),
    );
  }
}

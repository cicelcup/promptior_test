import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:promptior_test/firebase_options.dart';
import 'package:promptior_test/my_app.dart';

///Start point of the app
///
void main() async {
  ///Ensure plugins are initialized.
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///Load the Env file where the info is loaded.
  ///
  await dotenv.load(fileName: 'env');

  ///Firebase initialization.
  ///
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

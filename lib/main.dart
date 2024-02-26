import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:promptior_test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promptior AI Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promptior'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signInAnonymously();
              Logger().i("Signed in with temporary account.");
            } on FirebaseAuthException catch (e) {
              switch (e.code) {
                case "operation-not-allowed":
                  Logger().e("Anonymous auth hasn't been enabled for this project.");
                  break;
                default:
                  Logger().e("Unknown error.");
              }
            }
          },
          child: const Text('Promptior'),
        ),
      ),
    );
  }
}

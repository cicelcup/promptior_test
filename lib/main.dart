import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

void main() async {
  await dotenv.load();
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Promptior'),
        ),
        body: GestureDetector(
          onTap: () {
            Logger().i('Test Promptior');
          },
          child: const Text('Promptior'),
        ),
      ),
    );
  }
}

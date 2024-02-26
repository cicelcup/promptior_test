import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
          onTap: () async {
            var gemini = dotenv.env['GEMINI'];
            if (gemini == null) {
              Logger().i('Error loading the access to gemini');
            } else {
              final model = GenerativeModel(model: 'gemini-pro', apiKey: gemini);

              const prompt = '¿Qué servicios ofrece Promptior?';
              final content = [Content.text(prompt)];
              final response = await model.generateContent(content);
              Logger().i(response.text);
            }
          },
          child: const Text('Promptior'),
        ),
      ),
    );
  }
}

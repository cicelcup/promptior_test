import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import 'package:promptior_test/business/controller.dart';
import 'package:promptior_test/business/question_state.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/constants/logger_i18n.dart';
import 'package:promptior_test/constants/widget_constants.dart';
import 'package:provider/provider.dart';

///Actions of the buttons.
///
class SinglePageHelper {
  ///Auth the application.
  ///
  static Future<void> signIn(BuildContext context) async {
    var provider = Provider.of<Controller>(context, listen: false);
    provider.changeToLoading();
    await Future.delayed(WidgetConstants.mediumDelay);
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Logger().i(LoggerI18N.signedIn);
      provider.changeToPrompt();
    } catch (e) {
      Logger().e(LoggerI18N.unknownError);
      provider.changeToAuth();
    }
  }

  static Future<void> signOut(BuildContext context) async {
    var provider = Provider.of<Controller>(context, listen: false);
    provider.changeToLoading();
    await FirebaseAuth.instance.signOut();
    await Future.delayed(WidgetConstants.smallDelay);
    provider.changeToAuth();
  }

  static Future<void> askGemini(BuildContext context) async {
    const initialCount = 0;
    const maxCount = 20;
    const attemptsLocation = 'attempts';
    const geminiEnv = 'GEMINI';
    const geminiType = 'gemini-pro';

    var scaffold = ScaffoldMessenger.of(context);
    var provider = context.read<Controller>();

    if (provider.currentQuestion == QuestionState.first && provider.firstAnswer.isNotEmpty) {
      scaffold.showSnackBar(const SnackBar(content: Text(I18N.firstQuestionAlreadyAnswer)));
      return;
    }
    if (provider.currentQuestion == QuestionState.second && provider.secondAnswer.isNotEmpty) {
      scaffold.showSnackBar(const SnackBar(content: Text(I18N.secondQuestionAlreadyAnswer)));
      return;
    }

    provider.changeAnswersVisibility();
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(attemptsLocation).get();

    var value = snapshot.exists ? snapshot.value as int : initialCount;

    if (value < maxCount) {
      await ref.update({attemptsLocation: value + 1});

      var gemini = dotenv.env[geminiEnv];
      if (gemini == null) {
        Logger().e(LoggerI18N.errorGemini);
        scaffold.showSnackBar(const SnackBar(content: Text(LoggerI18N.errorGemini)));
        provider.changeAnswersVisibility();
        return;
      } else {
        final model = GenerativeModel(model: geminiType, apiKey: gemini);

        final prompt = provider.currentQuestion.text;
        final content = [Content.text(prompt)];
        final response = await model.generateContent(content);

        if (response.text != null) {
          Logger().i(response.text);
          if (provider.currentQuestion == QuestionState.first) {
            provider.firstAnswer = response.text!;
          } else {
            provider.secondAnswer = response.text!;
          }
        }
      }
    } else {
      scaffold.showSnackBar(const SnackBar(content: Text(I18N.maxAttemptsAmount)));
    }

    provider.changeAnswersVisibility();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:promptior_test/business/question_state.dart';
import 'package:promptior_test/business/single_page_state.dart';

class Controller extends ChangeNotifier {
  var currentState = SinglePageState.auth;
  var currentQuestion = QuestionState.first;
  var showAnswers = true;
  var firstAnswer = '';
  var secondAnswer = '';

  void changeToAuth() {
    currentState = SinglePageState.auth;
    notifyListeners();
  }

  void changeToLoading() {
    currentState = SinglePageState.loading;
    notifyListeners();
  }

  void changeToPrompt() {
    currentState = SinglePageState.prompt;
    notifyListeners();
  }

  void changeQuestion(QuestionState value) {
    currentQuestion = value;
    notifyListeners();
  }

  void changeFirstAnswer(String value) {
    firstAnswer = value;
  }

  void changeSecondAnswer(String value) {
    secondAnswer = value;
  }

  void changeAnswersVisibility() {
    showAnswers = !showAnswers;
    notifyListeners();
  }
}

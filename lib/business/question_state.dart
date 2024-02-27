import 'package:promptior_test/constants/i18n.dart';

enum QuestionState {
  first(I18N.firstQuestion),
  second(I18N.secondQuestion);

  const QuestionState(this.text);

  final String text;
}

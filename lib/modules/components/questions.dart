import 'package:flutter/material.dart';
import 'package:promptior_test/business/controller.dart';
import 'package:promptior_test/business/question_state.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/constants/widget_constants.dart';
import 'package:provider/provider.dart';

///Questions to do to Gemini.
///
class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    void changeQuestion(QuestionState? value) {
      if (value != null) {
        Provider.of<Controller>(context, listen: false).changeQuestion(value);
      }
    }

    var currentQuestion = context.watch<Controller>().currentQuestion;
    return Column(
      children: [
        WidgetConstants.space,
        Text(
          I18N.questions,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        WidgetConstants.space,
        ListTile(
          title: Text(QuestionState.first.text),
          leading: Radio<QuestionState>(
            value: QuestionState.first,
            groupValue: currentQuestion,
            onChanged: changeQuestion,
          ),
        ),
        ListTile(
          title: Text(QuestionState.second.text),
          leading: Radio<QuestionState>(
            value: QuestionState.second,
            groupValue: currentQuestion,
            onChanged: changeQuestion,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:promptior_test/constants/widget_constants.dart';
import 'package:promptior_test/modules/components/action_buttons.dart';
import 'package:promptior_test/modules/components/answers.dart';
import 'package:promptior_test/modules/components/questions.dart';

///Prompt Page.
///
class SinglePagePrompt extends StatelessWidget {
  const SinglePagePrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Questions(),
          WidgetConstants.space,
          Expanded(child: Answers()),
          WidgetConstants.space,
          ActionButtons(),
          WidgetConstants.space,
        ],
      ),
    );
  }
}

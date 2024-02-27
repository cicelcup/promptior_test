import 'package:flutter/material.dart';
import 'package:promptior_test/business/controller.dart';
import 'package:provider/provider.dart';

///Answers received from Gemini.
///
class Answers extends StatelessWidget {
  const Answers({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Controller>();
    return Card(
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 20.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.maxFinite,
        child: provider.showAnswers
            ? SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (provider.showAnswers) Text(provider.firstAnswer),
                    if (provider.showAnswers) const SizedBox(height: 16.0),
                    if (provider.showAnswers) Text(provider.secondAnswer),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

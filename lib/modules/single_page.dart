import 'package:flutter/material.dart';
import 'package:promptior_test/business/controller.dart';
import 'package:promptior_test/business/single_page_state.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/modules/components/single_page_auth.dart';
import 'package:promptior_test/modules/components/single_page_loading.dart';
import 'package:promptior_test/modules/components/single_page_prompt.dart';
import 'package:provider/provider.dart';

///Single Page where all the user interaction happens.
///
class SinglePage extends StatelessWidget {
  const SinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    var currentState = context.watch<Controller>().currentState;

    return Scaffold(
      appBar: AppBar(
        title: const Text(I18N.appTitle),
      ),
      body: switch (currentState) {
        SinglePageState.auth => const SinglePageAuth(),
        SinglePageState.loading => const SinglePageLoading(),
        SinglePageState.prompt => const SinglePagePrompt(),
      },
    );
  }
}

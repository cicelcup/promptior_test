import 'package:flutter/material.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/modules/components/single_page_helper.dart';

///Actions buttons for user interaction
///
class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: () async => SinglePageHelper.askGemini(context),
          child: const Text(I18N.askGemini),
        ),
        const SizedBox(width: 24.0),
        ElevatedButton(
          onPressed: () async => SinglePageHelper.signOut(context),
          child: const Text(I18N.signOut),
        ),
      ],
    );
  }
}

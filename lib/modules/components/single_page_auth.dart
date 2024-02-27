import 'package:flutter/material.dart';
import 'package:promptior_test/constants/i18n.dart';
import 'package:promptior_test/constants/widget_constants.dart';
import 'package:promptior_test/modules/components/single_page_helper.dart';

///Page in charge of the user authentication.
///
class SinglePageAuth extends StatelessWidget {
  const SinglePageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            I18N.anonymousSignInMessage,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          WidgetConstants.space,
          ElevatedButton(
            onPressed: () async => SinglePageHelper.signIn(context),
            child: const Text(I18N.anonymousSignIn),
          ),
        ],
      ),
    );
  }
}

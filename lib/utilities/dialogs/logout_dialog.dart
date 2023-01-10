import 'package:flutter/cupertino.dart';
import 'package:taosil/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Log Out",
    content: "Are you Sure you want to Log Out?",
    optionsBuilder: () => {
      "Cancel": false,
      "Log Out": true,
    },
  ).then((value) => value ?? false);
}

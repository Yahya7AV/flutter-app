import 'package:flutter/material.dart';
import 'package:taosil/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: "Sharing",
    content: "You cannot share an Empty Note!",
    optionsBuilder: () => {
      "Ok": null,
    },
  );
}

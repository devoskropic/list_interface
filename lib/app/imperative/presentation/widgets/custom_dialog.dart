import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomDialog {
  Future<dynamic> errorMsgDialog(
      BuildContext context, String headMsg, String message, String okText) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(LineIcons.exclamationTriangle, size: 30),
              const SizedBox(width: 6),
              Text(headMsg),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: const TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(okText),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> exitDialog(BuildContext context, String headMsg,
      String message, String okText, Function()? onPressed) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(headMsg),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(message),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(okText),
            ),
          ],
        );
      },
    );
  }
}

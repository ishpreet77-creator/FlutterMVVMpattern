import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/src/material/text_field.dart';
import 'package:flutter/src/widgets/constants.dart';
import 'dart:io' show Platform;
class baseClass {
  void PushScreen(BuildContext context, SecondScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen),
    );
  }

  void showAlert(BuildContext context, String title, String message, String actionButtonName, double ButtonfontSize, double messageFontSize, double titleFontSize) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                actionButtonName,
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center(child: Text(title)),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text(
                  actionButtonName,
                  style: TextStyle(fontSize: ButtonfontSize),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    }
  }



//MARK: SHOW ALERT ACTION WITH OK ACTION 
  void showAlertWithTwoButton(BuildContext context, String title, String message, double ButtonfontSize, double messageFontSize, double titleFontSize, {VoidCallback? OKPressed}) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: OKPressed != null ? OKPressed : () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          )),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: OKPressed != null ? OKPressed : () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}

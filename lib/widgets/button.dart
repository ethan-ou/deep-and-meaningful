import 'package:deep_and_meaningful/providers/theme_state.dart';
import 'package:deep_and_meaningful/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  CustomButton({@required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    bool _isLight =
        Provider.of<ThemeState>(context).isLight(Theme.of(context).brightness);

    return Material(
        borderRadius: BorderRadius.circular(14),
        color: _isLight
            ? Theme.of(context).primaryColor
            : Color.fromARGB(0, 0, 0, 0),
        child: InkWell(
            customBorder:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(14)),
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 56, vertical: 12.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: AppColor.lightBlue, width: _isLight ? 3 : 5),
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _isLight
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor,
                    fontSize: 28),
              ),
            )));
  }
}

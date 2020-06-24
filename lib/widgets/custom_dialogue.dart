import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomDialogue extends StatelessWidget {
  final String title,
      description,
      primaryButtonText,
      primaryButtonRoute,
      secondaryButtonText,
      secondaryButtonRoute;

  CustomDialogue({
    @required this.title,
    @required this.description,
    @required this.primaryButtonText,
    @required this.primaryButtonRoute,
    this.secondaryButtonText,
    this.secondaryButtonRoute,
  });

  static const double _padding = 20;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_padding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(_padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                    offset: Offset(0, 10)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24),
                AutoSizeText(
                  title,
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                AutoSizeText(
                  description,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: AutoSizeText(
                    primaryButtonText,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); //to first get rid of the dialogue box
                    Navigator.pushReplacementNamed(context, primaryButtonRoute);
                  },
                ),
                SizedBox(height: 10),
                showSecondaryButton(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  showSecondaryButton(BuildContext context) {
    if (secondaryButtonRoute != null && secondaryButtonText != null) {
      return FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); //to first get rid of the dialogue box
            Navigator.pushReplacementNamed(context, secondaryButtonRoute);
          },
          child: AutoSizeText(
            secondaryButtonText,
            maxLines: 1,
            style: TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w400),
          ));
    } else {
      return SizedBox(
        height: 10,
      );
    }
  }
}

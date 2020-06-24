import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelbudget/widgets/custom_dialogue.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: Colors.blue,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * 0.1),
                AutoSizeText(
                  "Welcome!",
                  style: TextStyle(fontSize: 44, color: Colors.white),
                ),
                SizedBox(height: _height * 0.1),
                AutoSizeText(
                  "Lets start planning your next trip",
                  maxLines: 2,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: _height * 0.15),
                RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialogue(
                                title:
                                    "Would you like to create a free account?",
                                description:
                                    "with an account, your data will be saved securely allowing access from multiple devices",
                                primaryButtonText: "Create Account",
                                primaryButtonRoute: "/signUp",
                                secondaryButtonText: "Maybe Later",
                                secondaryButtonRoute: "/home",
                              ));
                    }),
                SizedBox(height: _height * 0.05),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/signIn");
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

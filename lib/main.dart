import 'package:flutter/material.dart';
import 'package:travelbudget/services/auth_service.dart';
import 'package:travelbudget/views/first_view.dart';
import 'package:travelbudget/views/sign_up_view.dart';
import 'package:travelbudget/widgets/provider_widget.dart';

import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "Travel Budget App>>>>",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        //home: Home(),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          "/signUp": (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          "/signIn": (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          "/home": (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  //this will control whether we are gonna sure the sign in page or the home page
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}

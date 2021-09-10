import 'package:cook_now/pages/authenticate/signIn.dart';
import 'package:cook_now/pages/authenticate/register.dart';
import 'package:flutter/material.dart';


class Auth extends StatefulWidget {

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool showSignIn = true;

  void swapView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(swapView: swapView);
    }
    else {
      return Register(swapView: swapView);
    }
  }
}

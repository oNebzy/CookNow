import 'package:cook_now/models/MyUser.dart';
import 'package:cook_now/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cook_now/pages/home/breakfast/breakfast.dart';
import 'package:cook_now/pages/home/dinner/dinner.dart';
import 'package:cook_now/pages/home/lunch/lunch.dart';
import 'package:cook_now/pages/wrapper.dart';
import 'package:cook_now/pages/home/home.dart';
import 'package:cook_now/pages/authenticate/auth.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      catchError: (User,MyUser) => null,
      value: AuthService().user,
      child: MaterialApp(
         home: Wrapper(),
          routes: {
            '/auth': (context) => Auth(),
            '/home': (context) => Home(),
            '/breakfast': (context) => Breakfast(),
            '/lunch': (context) => Lunch(),
            '/dinner': (context) => Dinner(),
          }
      ),
    );
  }
}




    /**
    routes: {
        '/auth': (context) => Auth(),
        '/home': (context) => Home(),
        '/breakfast': (context) => Breakfast(),
        '/lunch': (context) => Lunch(),
        '/dinner': (context) => Dinner(),
        }
     */

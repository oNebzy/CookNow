import 'dart:io';
import 'package:cook_now/models/MyUser.dart';
import 'package:cook_now/pages/authenticate/auth.dart';
import 'package:cook_now/pages/home/home.dart';
import 'package:cook_now/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final MyUser? user = Provider.of<MyUser?>(context);
    String? id = user!.uid;

    if (user == null){
      return Auth();
    } else {
      return Home(id: id);
    }


  }


}



import 'package:cook_now/services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cook_now/pages/home/breakfast/breakfast.dart';

import 'dinner/dinner.dart';
import 'lunch/lunch.dart';


class Home extends StatefulWidget {
  String? id = "";
  Home({this.id});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What are you in the mood for?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue[900],
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
            child: TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.blue[900],
              ),
              label: Text(
                'logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]
                ),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await _auth.signOut();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              )
            ),
          ),
        ],
      ),
      body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Stack(
                      children: <Widget>[
                        Container( // container for the image
                          child: Image(
                            image: AssetImage('assets/breakfast.jpg'),
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Container( // container for the text button
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:65),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Breakfast(id: widget.id),
                                    ));
                                    //Navigator.pushNamed(context, '/breakfast', arguments: {'id': widget.id});
                                  },
                                  child: Text(
                                    'Breakfast',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue[900],
                                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20)
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                      children: <Widget>[
                        Container( // container for the image
                          child: Image(
                            image: AssetImage('assets/lunch.jpg'),
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Container( // container for the text button
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:65),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Lunch(id: widget.id),
                                      ));
                                    },
                                    child: Text(
                                        'Lunch',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                        padding: EdgeInsets.fromLTRB(50, 20, 50, 20)
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                      children: <Widget>[
                        Container( // container for the image
                          child: Image(
                            image: AssetImage('assets/dinner.jpg'),
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Container( // container for the text button
                            child: Column(
                              children: <Widget>[
                                SizedBox(height:65),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Dinner(id: widget.id),
                                      ));
                                    },
                                    child: Text(
                                      'Dinner',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                        padding: EdgeInsets.fromLTRB(50, 20, 50, 20)
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

              ],
            ),
          ),
    );
  }

}

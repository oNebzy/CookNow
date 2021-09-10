import 'package:cook_now/models/recipe.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_now/services/database.dart';
import 'package:provider/provider.dart';
import 'BreakfastList.dart';

class Breakfast extends StatefulWidget {

  String? id = '';
  Breakfast({this.id});

  @override
  _BreakfastState createState() => _BreakfastState(id);
}


class _BreakfastState extends State<Breakfast> {

  // get the current user ID
  String? id = '';
  _BreakfastState(this.id);
  FirebaseFirestore curr = FirebaseFirestore.instance;
  List<Recipe> recipes = [];

  Future<void> getData() async{
    print('$id');
    await curr.collection('users').doc('$id').collection('breakfast').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //print(doc.data());
        Map<String, dynamic> recipe = doc.data();
        String name = recipe['name'];
        List<dynamic> ingredients = recipe['ingredients'];
        List<dynamic> instructions = recipe['instructions'];
        Recipe curr = new Recipe(name, ingredients, instructions);
        recipes.add(curr);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    getData();

    final _formKey = GlobalKey<FormState>();
    String name = "";
    List<String> ingred = [];
    String tempIngredients = "";
    List<String> instrucs = [];
    String tempInstructions = "";

    void _showAddRecipePanel() {
      showModalBottomSheet(context: context, builder:(context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Recipe Name'
                  ),
                  validator: (val)=> val!.isEmpty ? 'Please enter recipe name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Ingredients - comma separated list'
                  ),
                  validator: (val)=> val!.isEmpty ? 'Please enter ingredients' : null,
                  onChanged: (val) {
                    setState(() => tempIngredients = val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Instructions - comma separated list'
                  ),
                  validator: (val)=> val!.isEmpty ? 'Please enter instructions' : null,
                  onChanged: (val) {
                    setState(() => tempInstructions = val);
                  },
                ),
                TextButton.icon(
                    icon: Icon(
                      Icons.check,
                      color: Colors.blue[900],
                    ),
                    label: Text(
                      'Add Recipe',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]
                      ),
                    ),
                    onPressed: () async {
                      ingred = tempIngredients.split(',');
                      instrucs = tempInstructions.split(',');
                      DatabaseService(widget.id!).addUserData('breakfast', name, ingred, instrucs);
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    )
                ),

              ],
            ),
          ),
        );
      });
    }

    return StreamProvider<List<Recipe>?>.value(
      initialData: null,
      value: DatabaseService(widget.id!).breakfast,
      child: Scaffold(
        backgroundColor: Colors.blue[700],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Breakfast Recipe List'),
          centerTitle: false,
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue[900],
                  ),
                  label: Text(
                    'Recipe',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]
                    ),
                  ),
                  onPressed: () async {
                    _showAddRecipePanel();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  )
              ),
            ),
          ],
        ),
        body:
            BreakfastList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cook_now/models/recipe.dart';

class RecipeTile extends StatelessWidget {

  Recipe? recipe;
  RecipeTile({this.recipe});


  @override
  Widget build(BuildContext context) {
    List<dynamic> ingredients = recipe!.ingredients;
    List<dynamic> instructions = recipe!.instructions;
    String ingre = "";
    String instru = "";
    for(int i = 0; i < ingredients.length; i++){
      ingre = ingre + ingredients[i] + '\n';
    }
    for(int j = 0; j < instructions.length; j++){
      instru = instru + '(${j+1}) - ' + instructions[j] + '\n\n';
    }

    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 30),
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                '${recipe!.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                '$ingre'
              ),
              Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                  '$instru'
              ),

            ],
          ),
        ),
      ),
    );
  }
}

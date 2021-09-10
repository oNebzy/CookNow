import 'package:cook_now/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../recipeTile.dart';


class BreakfastList extends StatefulWidget {
  @override
  _BreakfastListState createState() => _BreakfastListState();
}

class _BreakfastListState extends State<BreakfastList> {

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>?>(context);


    return ListView.builder(
      itemCount: recipes!.length,
      itemBuilder: (context, index) {
        return RecipeTile(recipe: recipes[index]);
      },
    );
  }
}

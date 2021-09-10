import 'package:cook_now/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../recipeTile.dart';


class LunchList extends StatefulWidget {
  @override
  _LunchListState createState() => _LunchListState();
}

class _LunchListState extends State<LunchList> {

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

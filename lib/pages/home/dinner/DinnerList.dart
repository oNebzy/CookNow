import 'package:cook_now/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../recipeTile.dart';


class DinnerList extends StatefulWidget {
  @override
  _DinnerListState createState() => _DinnerListState();
}

class _DinnerListState extends State<DinnerList> {

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_now/models/recipe.dart';
import 'package:cook_now/pages/home/breakfast/breakfast.dart';

class DatabaseService {

  // get current UID
  String? uid;
  DatabaseService (String x) {
    this.uid = x;
  }

  // collection references
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // create a user within the database
  Future createUserData(String e) async {
    return await users.doc(uid).set({'email': e, 'breakfastSize': 1, 'lunchSize': 1, 'dinnerSize': 1});
  }

  // update user data with a given recipe
  Future updateUserData(String meal, String name, List<String> ingredients, List<String> instructions) async {
    return await users.doc(uid).collection('$meal').doc('$name').set({
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
    });
  }

  //add user data
  Future addUserData(String meal, String name, List<String> ingredients, List<String> instructions) async {
    return await users.doc(uid).collection('$meal').doc('$name').set({
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
    });
  }

  // recipe list from snapshot
  List<Recipe> recipeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Recipe(doc.get('name'),doc.get('ingredients'),doc.get('instructions'));
    }).toList();
  }

  // getters for each collection within the specific uid
  // one for users, and one for breakfast, lunch, and dinner
  Stream<QuerySnapshot?> get userCol {
    return users.snapshots();
  }
  Stream<List<Recipe>> get breakfast {
    return users.doc(uid).collection('breakfast').snapshots().map(recipeListFromSnapshot);
  }
  Stream<List<Recipe>> get lunch {
    return users.doc(uid).collection('lunch').snapshots().map(recipeListFromSnapshot);
  }
  Stream<List<Recipe>> get dinner {
    return users.doc(uid).collection('dinner').snapshots().map(recipeListFromSnapshot);
  }

/** what would a recipe have?
 * picture?
 * name
 * ingredients
 * instructions
 *
 */





}
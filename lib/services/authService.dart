import 'package:cook_now/models/MyUser.dart';
import 'package:cook_now/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class to define all methods that will interact with Firebase Auth
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a MyUser object based user from firebase (firebase user)
  MyUser? userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) => userFromFirebaseUser(user!));
  }

  // Sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return userFromFirebaseUser(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password
  Future signInWithEmailPassword(String e, String p) async{
    try {
      UserCredential login = await _auth.signInWithEmailAndPassword(email: e, password: p);
      User? loginUser= login.user;
      return userFromFirebaseUser(loginUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailPassword(String e, String p) async{
    try {
      // create a new user within the auth service with the given email and password
      UserCredential login = await _auth.createUserWithEmailAndPassword(email: e, password: p);
      // create an instance of loginUser from the auth user above for easier access to UID
      User? loginUser= login.user;

      // create a new document for the user with the uid
      await DatabaseService(loginUser!.uid).createUserData(e);

      // create new breakfast collection for the user
      await DatabaseService(loginUser.uid).updateUserData(
          'breakfast',
          'Old Fashioned Pancakes',
          [ // ingredients
            '1 1/2 cups all-purpose flour', '3 1/2 teaspoons baking powder', '1 teaspoon salt',
            '1 tablespoon white sugar', '1 1/4 cups milk', '1 egg', '3 table spoons melted butter'
          ],
          [ // instructions
            'In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
            'Heat a lightly oiled griddle or frying pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
          ],
      );
      // create new lunch collection for the user
      await DatabaseService(loginUser.uid).updateUserData(
          'lunch',
          'Grilled Cheese',
          [ // ingredients
            '2 pieces of bread', 'Butter - unsalted', 'Cheese(s) of choice'
          ],
          [ // instructions
            'Butter the toast – spread 1/2 Tbsp butter on one side of each slice of bread',
            'Heat skillet – place a skillet over low to medium/low heat. A griddle should be at 275˚F. Immediately add 2 slices of bread with the butter-side-down',
            'Add cheese – stack cheeses on one of the pieces of bread, cover with the other piece of toast and flip the sandwich over',
            'Brown the toast – Continue sauteeing, flipping once, until both sides are golden brown and cheese is melted',
          ],
      );
      // create new dinner collection for the user
      await DatabaseService(loginUser.uid).updateUserData(
          'dinner',
          'Chicken Fajitas',
          [ // ingredients
            'Chili Powder', 'Ground Cumin', 'Garlic Powder', 'Paprika', 'Oregano', 'Salt', 'pepper',
            'Sliced bell peppers', 'Sliced onion', 'Chicken', 'Lime juice'
          ],
          [ // instructions
            'Season the chicken - Generously sprinkle the fajita seasoning on both sides of the chicken and use your fingers to press it in',
            'Cook the chicken - Heat a large skillet over medium heat and lightly coat it with a drizzle of olive oil or avocado oil. Sear the chicken breasts for about 7-8 minutes on each side. Then remove them from the pan and let them rest for a few minutes before slicing into strips',
            'Saute the bell peppers and onion - While the chicken is cooking, cut the bell peppers and onions into thin slices. Then saute them in the same skillet over medium heat for a few minutes until caramelized.',
            'Mix together - Add the chicken back into the skillet, squeeze fresh lime juice on top and stir everything together',
            'Wrap it up - Serve immediately with tortillas and toppings of choice.'
          ],
      );

      return userFromFirebaseUser(loginUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


}
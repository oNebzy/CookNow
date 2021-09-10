class Recipe {
  String name = "";
  List<dynamic> ingredients = [];
  List<dynamic> instructions = [];

  Recipe (String name, List<dynamic> ing, List<dynamic> ins) {
    this.name = name;
    this.ingredients = ing;
    this.instructions = ins;
  }
}
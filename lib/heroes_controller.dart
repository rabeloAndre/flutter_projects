import 'package:hero/hero_model.dart';
import 'package:flutter/foundation.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: "Thro"),
    HeroModel(name: "Spider-Man"),
    HeroModel(name: "Iron Man"),
    HeroModel(name: "Captain America"),
    HeroModel(name: "Black Panther")
  ];


  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}

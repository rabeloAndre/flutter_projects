import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hero/heroes_controller.dart';
import 'package:hero/hero_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
        onTap: () {
          heroesController.checkFavorite(model);
        },
        title: Text(model.name),
        trailing: model.isFavorite
            ? Icon(Icons.favorite, color: Colors.redAccent[700])
            : Icon(Icons.favorite_border));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Provider"),
          leading: Consumer<HeroesController>(
              builder: (context, heroesController, widget) {
            return Center(
                child: Text(
                    "${heroesController.heroes.where((i) => i.isFavorite).length}",
                    style: TextStyle(fontSize: 18)));
          })),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}

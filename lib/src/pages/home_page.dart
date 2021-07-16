import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:offline_detail_api/src/models/anime.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> animes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animes Watched"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              onPressed: () async {
                await _loadFavorites();
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Anime>>(
        future: fetchAnimes(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? AnimesList(animes: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _loadFavorites() async {
    // ListView.builder(
    //   itemCount: snapshot.data!,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(animes[index].title),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => DetailScreenAnime(
    //               anime: [animes[index]],
    //             ),
    //           ),
    //         );
    //       },
    //       trailing: Icon(
    //           animes[index].isFavorite ? Icons.favorite : Icons.favorite_border,
    //           color: animes[index].isFavorite ? Colors.red : null),
    //     );
    //   },
    // );
  }
}

class AnimesList extends StatefulWidget {
  final List<Anime> animes;

  AnimesList({Key? key, required this.animes}) : super(key: key);

  @override
  _AnimesListState createState() => _AnimesListState();
}

class _AnimesListState extends State<AnimesList> {
  List<Anime> favorites = [];
  List<Anime> fetchAnimes = [];
  ScrollController _scrollController = new ScrollController();

  void initState() {
    super.initState();
    fetchTen();

    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: _scrollController,
        itemCount: fetchAnimes.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreenAnime(
                        anime: [fetchAnimes[index]],
                      ),
                    ),
                  );
                },
                child: Text(fetchAnimes[index].title),
              ),
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DetailScreenAnime(
              //         anime: [widget.animes[index]],
              //       ),
              //     ),
              //   );
              // },
              trailing: IconButton(
                icon: Icon(
                    widget.animes[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.animes[index].isFavorite ? Colors.red : null),
                onPressed: () {
                  setState(() {
                    favorites.add(widget.animes[index]);
                    widget.animes[index].isFavorite
                        ? widget.animes[index].isFavorite = false
                        : widget.animes[index].isFavorite = true;
                  });
                },
              ));
        },
      );

  fetchTen() {
    for (var i = 0; i < 11; i++) {
      fetchAnimes.add(widget.animes[i]);
    }
  }
}

class DetailScreenAnime extends StatelessWidget {
  final List<dynamic> anime;

  DetailScreenAnime({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anime'),
        ),
        body: ListView.builder(
            itemCount: anime.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20, // to apply margin horizontally
                        runSpacing: 20,
                        children: [
                          Row(children: [
                            Expanded(
                                child: Text('Título: ${anime[index].title}',
                                    textAlign: TextAlign.center))
                          ]),
                          Row(children: [
                            Text('Genres: '),
                            for (var genre in anime[index].genres)
                              Expanded(
                                  child: Text(
                                      genre ==
                                              anime[index].genres[
                                                  (anime[index].genres.length) -
                                                      1]
                                          ? '${genre}.'
                                          : '${genre}, ',
                                      textAlign: TextAlign.center))
                          ]),
                          Row(children: [
                            Expanded(
                                child: Text(
                                    'Synopse: ${anime[index].synopsis}.',
                                    textAlign: TextAlign.center))
                          ])
                        ],
                      )));
            }));
  }
}

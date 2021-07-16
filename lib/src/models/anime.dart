import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<Anime>> fetchAnimes(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://animes-watched.herokuapp.com/animes/'));

  if (response.statusCode == 200) {
    return compute(parseAnimes, response.body);
  } else {
    throw Exception('Failed to load animes');
  }
}

List<Anime> parseAnimes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Anime>((json) => Anime.fromJson(json)).toList();
}

class Anime {
  final int id;
  final String url;
  final String image_url;
  final String trailer_url;
  final String title;
  final String tyype;
  final String source;
  final int episodes;
  final int rank;
  final String synopsis;
  final List<dynamic> genres;
  bool isFavorite;

  Anime(
      {required this.id,
      required this.url,
      required this.image_url,
      required this.trailer_url,
      required this.title,
      required this.tyype,
      required this.source,
      required this.episodes,
      required this.rank,
      required this.synopsis,
      required this.genres,
      this.isFavorite = false});

  @override
  String toString() {
    return 'Anime{id: $id, url: $url,image_url: $image_url,trailer_url: $trailer_url,title: $title,tyype: $tyype,source: $source,episodes: $episodes,rank: $rank,synopsis: $synopsis,genres: $genres}';
  }

  factory Anime.fromJson(Map<dynamic, dynamic> json) {
    return Anime(
        id: json['id'] as int,
        url: json['url'] as String,
        image_url: json['image_url'] as String,
        trailer_url: json['trailer_url'] as String,
        title: json['title'] as String,
        tyype: json['tyype'] as String,
        source: json['source'] as String,
        episodes: json['episodes'] as int,
        rank: json['rank'] as int,
        synopsis: json['synopsis'] as String,
        genres: json['genres'] as List<dynamic>);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "image_url": image_url,
        "trailer_url": trailer_url,
        "title": title,
        "tyype": tyype,
        "source": source,
        "episodes": episodes,
        "rank": rank,
        "synopsis": synopsis,
        "genres": genres
      };
}

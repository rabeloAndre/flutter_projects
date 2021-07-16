// import 'package:offline_detail_api/src/models/anime.dart';
// import 'package:offline_detail_api/src/providers/Database.dart';
// import 'package:dio/dio.dart';

// class AnimeApiProvider {
//   static Future<List<Anime>> getAllAnimes() async {
//     var url = "http://192.168.100.151:8000/animes/";
//     Response response = await Dio().get(url);

//     return (response.data as dynamic).map((anime) {
//       print('Inserting $anime');
//       DBProvider.db.insert(Anime.fromJson(anime));
//     }).toList();
//   }
// }

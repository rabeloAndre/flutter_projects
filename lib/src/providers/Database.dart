import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:offline_detail_api/src/models/anime.dart';
import 'package:flutter/widgets.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Anime('
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          'url TEXT,'
          'image_url TEXT,'
          'trailer_url TEXT,'
          'title TEXT,'
          'tyype TEXT,'
          'source TEXT,'
          'episodes INTEGER,'
          'rank INTEGER,'
          'synopsis TEXT,'
          'genres TEXT'
          ')');
    });
  }

  insert(Anime anime) async {
    final db = await database;
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Anime");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into Anime (id,url,image_url,trailer_url,title,tyype,source,episodes,rank,synopsis,genres)"
        " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
          anime.id,
          anime.url,
          anime.image_url,
          anime.trailer_url,
          anime.title,
          anime.tyype,
          anime.source,
          anime.episodes,
          anime.rank,
          anime.synopsis,
          anime.genres
        ]);
    return result;
  }

  animesList() async {
    final db = await database;
    var res = await db.query("Anime");
    List<Anime> list =
        res.isNotEmpty ? res.map((c) => Anime.fromJson(c)).toList() : [];
    return list;
  }
}



// class SQLiteDbProvider {
//   static Database? _database;
//   static final SQLiteDbProvider db = SQLiteDbProvider._();

//   SQLiteDbProvider._();

//   Future<Database> get database async => _database ??= await initDB();

//   Future<Database> initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "AnimeDB.db");
//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE Anime('
//           'id INTEGER PRIMARY KEY,'
//           'url TEXT,'
//           'image_url TEXT,'
//           'trailer_url TEXT,'
//           'title TEXT,'
//           'tyype TEXT,'
//           'source TEXT,'
//           'episodes TEXT,'
//           'rank TEXT,'
//           'synopsis TEXT,'
//           'genres TEXT'
//           ')');
//     });
//   }

//   Future<List<Anime>> getAllAnimes() async {
//     final db = await database;
//     List<Map> results =
//         await db.query("Anime", columns: Anime.columns, orderBy: "id ASC");
//     List<Anime> animes = [];
//     results.forEach((result) {
//       Anime anime = Anime.fromJson(result);
//       animes.add(anime);
//     });
//     return animes;
//   }

//   // Future<Anime> getProductById(int id) async {
//   //   final db = await database;
//   //   var result = await db.query("Anime", where: "id = ", whereArgs: [id]);
//   //   return result.isNotEmpty ? Anime.fromJson(result.first) : Null;
//   // }

//   insert(Anime anime) async {
//     final db = await database;
//     var maxIdResult =
//         await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Anime");
//     var id = maxIdResult.first["last_inserted_id"];
//     var result = await db.rawInsert(
//         "INSERT Into Product (id,url,image_url,trailer_url,title,tyype,source,episodes,rank,synopsis,genres)"
//         " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
//         [
//           id,
//           anime.url,
//           anime.image_url,
//           anime.trailer_url,
//           anime.title,
//           anime.tyype,
//           anime.source,
//           anime.episodes,
//           anime.rank,
//           anime.synopsis,
//           anime.genres
//         ]);
//     return result;
//   }

//   update(Anime anime) async {
//     final db = await database;
//     var result = await db.update("Anime", anime.toJson(),
//         where: "id = ?", whereArgs: [anime.id]);
//     return result;
//   }

//   delete(int id) async {
//     final db = await database;
//     db.delete("Anime", where: "id = ?", whereArgs: [id]);
//   }
// }



// class DBProvider {
//   late Database _database;
//   static late DBProvider db = DBProvider._();

//   DBProvider._();

//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await initDB();

//     return _database;
//   }

//   // Create the database and the Employee table
//   Future<Database> initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'anime_manager.db');

//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE Anime('
//           'id INTEGER PRIMARY KEY,'
//           'url TEXT,'
//           'image_url TEXT,'
//           'trailer_url TEXT,'
//           'title TEXT,'
//           'tyype TEXT,'
//           'source TEXT,'
//           'episodes TEXT,'
//           'rank TEXT,'
//           'synopsis TEXT,'
//           'genres TEXT,'
//           ')');
//     });
//   }

//   // Insert employee on database
//   createAnime(Anime newAnime) async {
//     await deleteAllAnimes();
//     final db = await database;
//     final res = await db.insert('Anime', newAnime.toJson());

//     return res;
//   }

//   // Delete all employees
//   Future<int> deleteAllAnimes() async {
//     final db = await database;
//     final res = await db.rawDelete('DELETE FROM Anime');

//     return res;
//   }

//   Future<List<Anime>> getAllAnimes() async {
//     final db = await database;
//     final res = await db.rawQuery("SELECT * FROM ANIME");

//     List<Anime> list =
//         res.isNotEmpty ? res.map((c) => Anime.fromJson(c)).toList() : [];

//     return list;
//   }
// }




// void storage(List<Anime> animesList) async {
//   Future<Database> getDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(await getDatabasesPath(), 'anime_database.db');
//     WidgetsFlutterBinding.ensureInitialized();
//     final database = openDatabase(
//       path,
//       onCreate: (db, version) {
//         return db.execute('CREATE TABLE Anime('
//             'id INTEGER PRIMARY KEY,'
//             'url TEXT,'
//             'image_url TEXT,'
//             'trailer_url TEXT,'
//             'title TEXT,'
//             'tyype TEXT,'
//             'source TEXT,'
//             'episodes TEXT,'
//             'rank TEXT,'
//             'synopsis TEXT,'
//             'genres TEXT,'
//             ')');
//       },
//       version: 1,
//     );
//     return database;
//   }

//   Future<void> insertAnime(Anime anime) async {
//     Future<Database> database = getDatabase();
//     final db = await database;
//     await db.insert(
//       'animes',
//       anime.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   // A method that retrieves all the dogs from the dogs table.
//   Future<List<Anime>> animes() async {
//     Future<Database> database = getDatabase();
//     final db = await database;

//     final List<Map<String, dynamic>> maps = await db.query('animes');

//     return List.generate(maps.length, (i) {
//       return Anime(
//           id: maps[i]['id'],
//           url: maps[i]['url'],
//           image_url: maps[i]['image_url'],
//           trailer_url: maps[i]['trailer_url'],
//           title: maps[i]['title'],
//           tyype: maps[i]['tyype'],
//           source: maps[i]['source'],
//           episodes: maps[i]['episodes'],
//           rank: maps[i]['rank'],
//           synopsis: maps[i]['synopsis'],
//           genres: maps[i]['genres']);
//     });
//   }

//   Future<void> updateAnime(Anime anime) async {
//     Future<Database> database = getDatabase();
//     final db = await database;

//     await db.update(
//       'animes',
//       anime.toMap(),
//       where: 'id = ?',
//       whereArgs: [anime.id],
//     );
//   }

//   Future<void> deleteAnime(int id) async {
//     Future<Database> database = getDatabase();
//     final db = await database;

//     await db.delete(
//       'animes',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   for (var anime in animesList) {
//     anime = Anime(
//         id: anime.id,
//         url: anime.url,
//         image_url: anime.image_url,
//         trailer_url: anime.trailer_url,
//         title: anime.title,
//         tyype: anime.tyype,
//         source: anime.source,
//         episodes: anime.episodes,
//         rank: anime.rank,
//         synopsis: anime.synopsis,
//         genres: anime.genres);
//     await insertAnime(anime);
//   }

//   Future<Database> database = getDatabase();
//   final db = await database;
//   await db.close();

  // Create a Dog and add it to the dogs table
  // var fido = Dog(
  //   id: 0,
  //   name: 'Fido',
  //   age: 35,
  // );

  // await insertDog(fido);

  // // Now, use the method above to retrieve all the dogs.
  // print(await dogs()); // Prints a list that include Fido.

  // // Update Fido's age and save it to the database.
  // fido = Dog(
  //   id: fido.id,
  //   name: fido.name,
  //   age: fido.age + 7,
  // );
  // await updateDog(fido);

  // // Print the updated results.
  // print(await dogs()); // Prints Fido with age 42.

  // // Delete Fido from the database.
  // await deleteDog(fido.id);

  // // Print the list of dogs (empty).
  // print(await dogs());
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/GetxController.dart';
import 'package:movieapp/widgets/MovieList.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MySearch extends SearchDelegate {
  MovieController controller = Get.put(MovieController());
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        hintColor: Colors.red,
        textTheme: const TextTheme(
            headline6: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.black);
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: controller.getMovies(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print('LIIISTTT${snapshot}');
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 14),
              child: MovieList(movies: controller.list),
            );
          }
        });
  }

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];
}

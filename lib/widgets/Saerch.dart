import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/GetxController.dart';
import 'package:movieapp/widgets/MovieList.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MySearch extends SearchDelegate {
  MovieController controller = Get.put(MovieController());
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith();
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
    print(controller.list);
    if (query == 'your') {
      return MovieList(movies: controller.list);
    }
    return Container();
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/home.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}

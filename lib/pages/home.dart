// ignore_for_file: avoid_print, camel_case_types, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/MovieList.dart';
import '../widgets/Saerch.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  List movies = [];
  List popular = [];
  List topRated = [];
  List latest = [];
  List upcoming = [];
  List now = [];
  List search = [];
  String query = '';
  late TMDB tmdb;
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    const apiKey = '2f4dc6d56ff72989d31348ef2578680b';
    const apiToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjRkYzZkNTZmZjcyOTg5ZDMxMzQ4ZWYyNTc4NjgwYiIsInN1YiI6IjYyODNiODMyZWM0NTUyMTAzMmE5YjdmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RXzEniM-hq8DR2EFa5FEKVeTHwkNQnZzhoRK-LE1KBw';

    TMDB tmdbrequest = TMDB(ApiKeys(apiKey, apiToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trend = await tmdbrequest.v3.trending.getTrending();
    Map popularmap = await tmdbrequest.v3.tv.getPopular();
    Map topmap = await tmdbrequest.v3.movies.getTopRated();
    // ignore: unused_local_variable
    Map latestmap = await tmdbrequest.v3.movies.getLatest();
    Map upcomingmap = await tmdbrequest.v3.movies.getUpcoming();
    Map nowmap = await tmdbrequest.v3.movies.getNowPlaying();
    Map searchmap = await tmdbrequest.v3.search.queryMovies('our');

    setState(() {
      tmdb = tmdbrequest;
      movies = trend['results'];
      popular = popularmap['results'];
      topRated = topmap['results'];
      /*latest = latestmap['results'];*/
      upcoming = upcomingmap['results'];
      now = nowmap['results'];
      search = searchmap['results'];
      //  print(search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'TheMovies',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      'Trending',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieList(movies: movies),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Popular',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieList(movies: popular),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Top Rate in Morocco',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieList(movies: topRated),
              /*const Text('Latest Movies'),
              const SizedBox(
                height: 10,
              ),
               MovieList(movies: latest),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Up Coming',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieList(movies: upcoming),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('Now In theatres ',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieList(movies: now),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: ((context, index) {
          return Container(
              color: Colors.black.withOpacity(0.08),
              height: 200,
              width: 200,
              child: InkWell(
                // ignore: prefer_interpolation_to_compose_strings
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w400' +
                                      movies[index]['poster_path']))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        movies[index]['title'] ??
                            movies[index]['original_name'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ));
        }),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

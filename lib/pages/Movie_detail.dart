import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  String? image;
  String? name;
  String? title;
  String? overview;
  MovieDetail(
      {required this.image,
      required this.name,
      required this.overview,
      required this.title});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

bool hover = false;

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          MouseRegion(
            onEnter: (event) {
              setState(() {
                hover = true;
              });
            },
            onExit: (e) {
              setState(() {
                hover = false;
              });
            },
            child: Container(
                width: double.infinity,
                height: hover ? 550 : 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image!),
                        fit: BoxFit.cover))),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Text(
                  widget.title ?? widget.name!,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(253, 255, 255, 255),
                      fontFamily: 'Schyler'),
                )
              ],
            ),
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'Description : ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.overview!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                  letterSpacing: 0.5),
            ),
          )
        ]),
      ),
    );
  }
}

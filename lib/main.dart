import 'package:flutter/material.dart';

import 'movies_list.dart';

void main(){
  runApp(MyMovies());
}

class MyMovies extends StatelessWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Les films ghibli",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: MoviesList(),
    );
  }
}

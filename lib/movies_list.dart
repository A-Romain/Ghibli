import 'package:flutter/material.dart';
import 'package:ghibli/utils/helper.dart';
import 'detail_movie.dart';
import 'model/movie.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {

  int moviesCount = 0;
  List<Movie>movies = [];
  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = HttpHelper();
    intialize();
  }

  Future intialize() async {
    movies = (await helper.getFilms())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Ghibli"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (BuildContext context, int pos) {
            final movie = this.movies[pos];
            return Padding(
                padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
              child: Card(
                color: Colors.orangeAccent,
                elevation: 2,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 150,
                        height: 250,
                        child: Container(
                          color: Colors.white,
                          child: Image.network(movie.image, fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                    Expanded(child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title, textAlign: TextAlign.left,style: TextStyle(fontSize: 40),),
                          Text(movie.director + " " + movie.release_date, textAlign: TextAlign.left,style: TextStyle(fontSize: 25),)
                        ],
                      ),
                    )),
                    InkWell(
                      child: Icon(Icons.arrow_forward, size: 50),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return DetailMovie(movieId: movie.id);
                            })
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

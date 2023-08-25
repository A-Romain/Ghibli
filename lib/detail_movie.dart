import 'package:flutter/material.dart';
import 'package:ghibli/utils/helper.dart';
import 'model/movie.dart';

class DetailMovie extends StatefulWidget {
  String movieId;
  DetailMovie({required this.movieId});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {

  HttpHelper helper = HttpHelper();
  Movie? movie;
  Future<Movie?>? film;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = HttpHelper();
    film = helper.getFilm(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return FutureBuilder(
        future: film,
        builder: (context, snap){
          if(snap.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text("Ghibli Movie"),
              ),
              body: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(snap.data!.title,
                      style: TextStyle(fontSize: 45),),
                      Container(
                        alignment: Alignment.center,
                        width: size.width / 1.8,
                        child: Image.network(snap.data!.image, fit: BoxFit.contain,),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else {
            return Text("on a pas trouvé");
          }
        }
    );
  }
}

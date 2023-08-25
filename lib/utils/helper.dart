import 'dart:convert';
import 'dart:io';
import 'package:ghibli/model/movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper{
  final String urlBase = "https://ghibliapi.vercel.app";
  final String urlMethod = "/films";

  Future<List<Movie>?> getFilms() async {
    final String ghibli = urlBase + urlMethod;
    http.Response result = await http.get(Uri.parse(ghibli));
    print(result.statusCode);
    if(result.statusCode == HttpStatus.ok){
      final responseBody = jsonDecode(result.body).cast<Map<String, dynamic>>();
      List<Movie> movies = responseBody.map<Movie>((el) => Movie.fromJson(el)).toList();
      print(movies.first.title);
      return movies;
    }else {
      print("erreur");
      return null;
    }
  }

  Future<Movie?> getFilm(String id) async{
    final String ghibli = urlBase + urlMethod;
    http.Response result = await http.get(Uri.parse(ghibli + "/" + id));

    if(result.statusCode == HttpStatus.ok){
      final responseBody = jsonDecode(result.body);
      return Movie.fromJson(responseBody);
    }else {
      throw Exception("Echec de la lecture du json");
     //return null;
    }
  }
}
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/models/TRP.dart';
import 'horizontal_cards.dart';

Future<Trp> fetchMovies() async {
  final String keyVar = dotenv.env['API_KEY']!;
  final response = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$keyVar"));
  if (response.statusCode == 200) {
    return Trp.fromJson(json.decode(response.body));
  } else {
    throw Exception('not able to Fetch the Now Playing Movies');
  }
}

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({super.key});

  @override
  _NowPlayingMoviesState createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Image.asset('assets/loading.jpg'),
          );
        } else {
          return HorizontalCards(snapshot.data!.results);
        }
      },
    );
  }
}

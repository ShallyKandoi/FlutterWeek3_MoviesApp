import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/TRP.dart';
import './horizontal_cards.dart';

Future<Trp> fetchMovies() async {
  final String keyVar = dotenv.env['API_KEY']!;
  final response = await http.get(
      Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$keyVar"));
  if (response.statusCode == 200) {
    return Trp.fromJson(json.decode(response.body));
  } else {
    throw Exception('not able to Fetch the trending Movies');
  }
}

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Image(
              image: AssetImage('assets/loading.jpg'),
            ),
          );
        } else {
          return HorizontalCards(snapshot.data.results);
        }
      },
    );
  }
}

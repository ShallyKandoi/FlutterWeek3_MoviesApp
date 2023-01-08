import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/TRP.dart';
import './horizontal_cards.dart';

Future<Trp> fetchMovies() async {
  final String keyVar = dotenv.env['API_KEY']!;
  final response = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$keyVar"));
  if (response.statusCode == 200) {
    return Trp.fromJson(json.decode(response.body));
  } else {
    throw Exception('not able to Fetch the Top Rated Movies');
  }
}

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Image.asset('assets/loading.jpg'),
          );
        } else {
          return HorizontalCards(snapshot.data.results);
        }
      },
    );
  }
}

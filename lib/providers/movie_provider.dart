import 'dart:math';
import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';


final List<Movie> initialData = [];

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();

  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
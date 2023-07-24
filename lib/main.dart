
import'package:maybefish/providers/movie_provider.dart';
import 'package:maybefish/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';




void main () {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
        home: const HomeScreen()
    );
  }
}


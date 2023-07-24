import 'package:flutter/material.dart';
import 'package:maybefish/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class myListScreen extends StatefulWidget {
  const myListScreen({super.key});

  @override
  State<myListScreen> createState() => _myListScreenState();
}

class _myListScreenState extends State<myListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My List (${_myList.length})'),

      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentMovie = _myList[index];
          return Card(
            key: ValueKey(currentMovie.score),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.score)

            )
          );
        }
      )
    );
  }
}

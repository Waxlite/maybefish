import 'dart:collection';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => csvModel(),
          child: const myApp(),
          ),
  );
}


GoRouter router() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/myList',
        builder: (context, state) => const myApp(),
      )

    ],
  );
}


class csvModel extends ChangeNotifier {

  final List<String> _scores = [];

  UnmodifiableListView<String> get scores => UnmodifiableListView(_scores);

  void add(String score) {
    _scores.add(score);
    notifyListeners();

  }
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('suck')),
      body: Container(
        child:
          Consumer<csvModel>(builder: (context, csvModel, child) =>
          Text('Heres ya Score ${csvModel.scores}'))


      )


    );
  }
}

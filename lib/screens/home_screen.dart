import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:maybefish/models/movie_model.dart';
import 'package:provider/provider.dart';

import 'package:maybefish/providers/movie_provider.dart';

import 'fav_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;



    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        title: const Text('Provider'),
      ),
          body: Padding(
        padding: const EdgeInsets.all(15),
    child: Column(
      children: <Widget> [

        Flexible(
          flex: 2,
          child: Container(
            child: PhotoView(
              imageProvider: AssetImage('assets/20230503_23USORSPR1_BG2HAM-7-4-3_T0.JPG'),
            )
          ),
        ),
        ElevatedButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => myListScreen()
        ),
        );
          }, child: Text('go to list')
        ),
        SizedBox(height: 100),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            height: 75,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                userInput,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold)
              ),
            )
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == ''|| userInput == 'INVALID') {userInput = '0';} else {
                  userInput += '0';
                }
              });}, child: Text('0')
              ),
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == ''|| userInput == 'INVALID') {userInput = '1';} else {
                  userInput += '1';
                }
              });}, child: Text('1')
              ),
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == ''|| userInput == 'INVALID') {userInput = '2';} else {
                  userInput += '2';
                }
              });}, child: Text('2')
              ),
            ]
          ),
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == '' || userInput == 'INVALID') {userInput = '3';} else {
                  userInput += '3';
                }
              });}, child: Text('3')
              ),
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == ''|| userInput == 'INVALID') {userInput = '4';} else {
                  userInput += '4';
                }
              });}, child: Text('4')
              ),
              ElevatedButton(onPressed: () {setState(() {
                if(userInput == ''|| userInput == 'INVALID') {userInput = '5';} else {
                  userInput += '5';
                }
              });}, child: Text('5')
              ),
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {setState(() {
              if(userInput.length == 4) {myList.add(Movie(score : userInput));
              userInput = '';} else{userInput = 'INVALID';}
              }
            );}, child: Text('Submit')
            ),
            ElevatedButton(onPressed: () {setState(() {
              userInput = '';
              }
            );}, child: Text('CLEAR')
            ),
          ],
        ),
      ]
    ),
    )
    );
  }
  dynamic userInput = '';
}

import 'package:flutter/material.dart';
import 'package:pokedex/pages/poke-home.dart';
import 'package:pokedex/res/my-colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.malibu,
          title: Text('Pokemon'),
        ),
        body: PokeHomePage(),
      ),
    );
  }
}

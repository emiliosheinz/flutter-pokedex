import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-card.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/api.dart';

class PokeHomePage extends StatefulWidget {
  @override
  _PokeHomePageState createState() => _PokeHomePageState();
}

class _PokeHomePageState extends State<PokeHomePage> {
  List<PokemonModel> pokemonsList;

  @override
  void initState() {
    super.initState();

    _getPokemons();
  }

  _getPokemons() async {
    Response resp = await PokeApi().listPokemons();
    print(resp);
  }

  Widget _buildPokeCards(BuildContext context, int index) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _buildPokeCards);
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/poke-details.dart';

class PokeMiddlePage extends StatelessWidget {
  final PokemonModel pokemon;

  PokeMiddlePage({@required this.pokemon});

  _navigateToDetailsPage(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PokeDetailsPage(
            pokemon: pokemon,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    PokeTypeEnum mainType = pokemon.types[0];

    _navigateToDetailsPage(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Container(
          child: Center(
            child: Hero(
              tag: pokemon.id,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.network(pokemon.image),
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mainType.color,
                mainType.color.withOpacity(0.8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

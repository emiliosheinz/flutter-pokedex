import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/res/my-colors.dart';

class PokeDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  PokeDetailsPage({@required this.pokemon});

  _renderPokemonImage() {
    return Hero(
      tag: pokemon.id,
      child: SizedBox(
        height: 120,
        width: 120,
        child: Image.network(pokemon.image),
      ),
    );
  }

  _renderPokemonStats() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          pokemon.name,
          style: TextStyle(
            color: MyColors.emperor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    PokeTypeEnum mainType = pokemon.types.first;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: mainType.color,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: _renderPokemonStats(),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 60,
            top: MediaQuery.of(context).size.height * 0.20 - 80,
            child: _renderPokemonImage(),
          ),
        ],
      ),
    );
  }
}

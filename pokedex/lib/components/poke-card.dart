import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-type.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/res/my-colors.dart';

class PokeCard extends StatelessWidget {
  final PokemonModel pokemon;

  PokeCard({@required this.pokemon});

  _renderPokeImage() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.network(
        pokemon.image,
      ),
    );
  }

  _renderPokeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          pokemon.name,
          style: TextStyle(
              color: MyColors.emperor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Text(
          '#001',
          style: TextStyle(
              color: MyColors.silverChalice, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  _renderPokeTypes() {
    return PokeType(
      type: PokeTypeEnum.grass,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          _renderPokeImage(),
          SizedBox(
            width: 15,
          ),
          _renderPokeText(),
          Spacer(),
          _renderPokeTypes()
        ],
      ),
    );
  }
}
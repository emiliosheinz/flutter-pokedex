import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-type.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/poke-middle.dart';
import 'package:pokedex/res/my-colors.dart';

class PokeCard extends StatelessWidget {
  final PokemonModel pokemon;

  PokeCard({@required this.pokemon});

  getFormatedPokemonId() {
    var zeros = pokemon.id.toString().length;

    if (zeros == 1) {
      return '#00${pokemon.id}';
    }

    return '#0${pokemon.id}';
  }

  _onPokemonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokeMiddlePage(
          pokemon: pokemon,
        ),
      ),
    );
  }

  _renderPokeImage() {
    return Hero(
      tag: pokemon.id,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.network(
          pokemon.image,
        ),
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
          getFormatedPokemonId(),
          style: TextStyle(
              color: MyColors.silverChalice, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  _renderPokeTypes() {
    return Row(
      children: pokemon.types.map((type) {
        return PokeType(
          type: type,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onPokemonPress(context);
      },
      highlightColor: Color.fromRGBO(255, 255, 255, 0.6),
      splashColor: pokemon.types[0].color,
      child: Padding(
        padding: const EdgeInsets.all(20),
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
      ),
    );
  }
}

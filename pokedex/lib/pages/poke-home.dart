import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-card.dart';
import 'package:pokedex/components/poke-type.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/res/my-colors.dart';
import 'package:pokedex/services/api.dart';

class PokeHomePage extends StatefulWidget {
  @override
  _PokeHomePageState createState() => _PokeHomePageState();
}

class _PokeHomePageState extends State<PokeHomePage> {
  List<PokemonModel> pokemonsList;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _getPokemons();
  }

  _getPokemons() async {
    setState(() {
      isLoading = true;
    });

    List<PokemonModel> pokemons = [];
    Response resp = await PokeApi().listPokemons();

    final pokemonsFromApi = JsonDecoder().convert(resp.toString());

    pokemonsFromApi['pokemons'].forEach((pokemon) {
      List<PokeTypeEnum> typesList = [];

      pokemon['types'].forEach((type) {
        int enumIndex = PokemonModel.getEnumIndexFromPokeType(type);
        typesList.add(PokeTypeEnum.values[enumIndex]);
      });

      pokemons.add(PokemonModel.fromJson(pokemon, typesList));
    });

    setState(() {
      pokemonsList = pokemons;
      isLoading = false;
    });
  }

  Widget _buildPokeCards(BuildContext context, int index) {
    return PokeCard(
      pokemon: pokemonsList[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          )
        : Container(
            child: ListView.separated(
                itemBuilder: _buildPokeCards,
                itemCount: pokemonsList.length,
                separatorBuilder: (context, index) => Divider(
                      color: MyColors.dustyGray,
                    )),
          );
  }
}

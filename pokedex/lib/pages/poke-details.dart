import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-loader.dart';
import 'package:pokedex/components/poke-stat-row.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/poke-stat.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/res/my-colors.dart';
import 'package:pokedex/services/api.dart';

class PokeDetailsPage extends StatefulWidget {
  final PokemonModel pokemon;

  PokeDetailsPage({@required this.pokemon});

  @override
  _PokeDetailsPageState createState() => _PokeDetailsPageState();
}

class _PokeDetailsPageState extends State<PokeDetailsPage> {
  List<PokeStat> pokemonStats;

  @override
  void initState() {
    super.initState();

    _getPokemonDetails();
  }

  _getPokemonDetails() async {
    List<PokeStat> stats = [];
    PokeTypeEnum mainType = widget.pokemon.types.first;

    Response resp = await PokeApi().getPokemonDetails(widget.pokemon.id);
    final pokemonDetails = JsonDecoder().convert(resp.toString());

    pokemonDetails['stats'].forEach((stat) {
      stats.add(PokeStat.fromJson(stat, mainType.color));
    });

    setState(() {
      pokemonStats = stats;
    });
  }

  _renderPokemonImage() {
    return Hero(
      tag: widget.pokemon.id,
      child: SizedBox(
        height: 120,
        width: 120,
        child: Image.network(widget.pokemon.image),
      ),
    );
  }

  Widget _renderPokemonStats() {
    if (pokemonStats == null) {
      return Center(
        child: PokeLoader(),
      );
    }

    return Column(
      children: pokemonStats.map((stat) {
        print(stat);
        return PokeStatRow(
          stat: stat,
        );
      }).toList(),
    );
  }

  _renderPokemonInfo() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          widget.pokemon.name,
          style: TextStyle(
            color: MyColors.emperor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _renderPokemonStats(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    PokeTypeEnum mainType = widget.pokemon.types.first;

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
                  child: _renderPokemonInfo(),
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

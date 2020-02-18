import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-loader.dart';
import 'package:pokedex/components/poke-stat-row.dart';
import 'package:pokedex/components/poke-type.dart';
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
  String pokeDescription = '';

  @override
  void initState() {
    super.initState();

    _getPokemonDetails();
  }

  _getPokemonDetails() async {
    List<PokeStat> stats = [];
    PokeTypeEnum mainType = widget.pokemon.types.first;

    Response resp = await PokeApi().getPokemonDetails(widget.pokemon.id);
    print(resp);
    final pokemonDetails = JsonDecoder().convert(resp.toString());

    pokemonDetails['stats'].forEach((stat) {
      stats.add(PokeStat.fromJson(stat, mainType.color));
    });

    if (mounted) {
      setState(() {
        pokemonStats = stats;
        pokeDescription = pokemonDetails['description'];
      });
    }
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

  _renderName() {
    return Text(
      widget.pokemon.name,
      style: TextStyle(
        color: MyColors.emperor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  _renderDescription() {
    return Text(
      pokeDescription,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }

  Widget _renderPokemonStats() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: pokemonStats.map((stat) {
          print(stat);
          return PokeStatRow(
            stat: stat,
          );
        }).toList(),
      ),
    );
  }

  _renderPokeTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.pokemon.types.map((type) {
        return PokeType(
          type: type,
          isMinimalist: false,
        );
      }).toList(),
    );
  }

  _renderDelayedData() {
    if (pokemonStats == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: SizedBox(
            height: 25,
            width: 25,
            child: PokeLoader(),
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        _renderDescription(),
        SizedBox(
          height: 20,
        ),
        _renderPokemonStats(),
      ],
    );
  }

  _renderPokemonInfo() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        _renderName(),
        SizedBox(
          height: 20,
        ),
        _renderPokeTypes(),
        SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
          transitionBuilder: (child, animation) => ScaleTransition(
            child: child,
            scale: animation,
          ),
          duration: Duration(milliseconds: 150),
          child: _renderDelayedData(),
        ),
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  mainType.color,
                  mainType.color.withOpacity(0.4),
                ],
              ),
            ),
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
          Positioned(
            left: 10,
            top: 40,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-loader.dart';
import 'package:pokedex/components/poke-type.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/poke-move.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/res/my-colors.dart';
import 'package:pokedex/services/api.dart';

class PokeMovesPage extends StatefulWidget {
  @override
  _PokeMovesPageState createState() => _PokeMovesPageState();
}

class _PokeMovesPageState extends State<PokeMovesPage> {
  List<PokeMoveModel> moves;

  @override
  void initState() {
    super.initState();

    _getMoves();
  }

  _getMoves() async {
    Response resp = await PokeApi().getMoves();

    final movesFromApi = resp.data;

    List<PokeMoveModel> _moves = [];

    movesFromApi.forEach((move) {
      int enumIndex = PokemonModel.getEnumIndexFromPokeType(move['type']);
      PokeTypeEnum moveType = PokeTypeEnum.values[enumIndex];

      _moves.add(PokeMoveModel(name: move['name'], type: moveType));
    });

    if (mounted) {
      setState(() {
        moves = _moves;
      });
    }
  }

  _renderContent() {
    if (moves == null) {
      return Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: PokeLoader(),
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: MyColors.dustyGray,
      ),
      itemCount: moves.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 10,
            right: 10,
          ),
          child: Row(
            children: <Widget>[
              Text(
                moves[index].name,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              PokeType(
                type: moves[index].type,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: _renderContent(),
      ),
    );
  }
}

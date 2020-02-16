import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/poke-card.dart';
import 'package:pokedex/components/poke-loader.dart';
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

  _renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Pokemon',
        style: TextStyle(color: Colors.black87),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              MyColors.appBar01.withOpacity(0.6),
              MyColors.appBar02.withOpacity(0.6),
              MyColors.appBar03.withOpacity(0.6),
              MyColors.appBar04.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  _renderContent() {
    if (isLoading) {
      return Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: PokeLoader(),
        ),
      );
    }

    return Container(
      child: ListView.separated(
        itemBuilder: _buildPokeCards,
        itemCount: pokemonsList.length,
        separatorBuilder: (context, index) => Divider(
          color: MyColors.dustyGray,
        ),
      ),
    );
  }

  _renderBottomTab() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.appBar01.withOpacity(0.8),
      selectedItemColor: Colors.black,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/pokemon.png'),
          ),
          title: Text('Pokemon'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/cd.png'),
          ),
          title: Text('Moves'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/kandy.png'),
          ),
          title: Text('Items'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(),
      body: _renderContent(),
      bottomNavigationBar: _renderBottomTab(),
    );
  }
}

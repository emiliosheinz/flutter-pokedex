import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/poke-details.dart';

class PokeMiddlePage extends StatefulWidget {
  final PokemonModel pokemon;

  PokeMiddlePage({@required this.pokemon});

  @override
  _PokeMiddlePageState createState() => _PokeMiddlePageState();
}

class _PokeMiddlePageState extends State<PokeMiddlePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  _navigateToDetailsPage(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PokeDetailsPage(
            pokemon: widget.pokemon,
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _animateImage() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    PokeTypeEnum mainType = widget.pokemon.types[0];

    _navigateToDetailsPage(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: InkWell(
          onDoubleTap: _animateImage,
          child: Container(
            child: Center(
              child: Hero(
                tag: widget.pokemon.id,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform:
                          Matrix4.rotationY(_controller.value * 2.0 * pi),
                      child: child,
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(widget.pokemon.image),
                  ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';

class PokeType extends StatelessWidget {
  final PokeTypeEnum type;

  PokeType({@required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: type.color,
        boxShadow: [
          BoxShadow(
            color: type.color,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 1,
          )
        ],
      ),
      child: Icon(
        Icons.bug_report,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

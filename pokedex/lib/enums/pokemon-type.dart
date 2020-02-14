import 'package:flutter/material.dart';

enum PokemonType {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
}

extension PokemonTypeExtension on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.grass:
        return Colors.green;
      case PokemonType.poison:
        return Colors.purple;
      case PokemonType.fire:
        return Colors.orange;
      case PokemonType.flying:
        return Colors.blue;
      case PokemonType.water:
        return Colors.blueAccent;
      case PokemonType.bug:
        return Colors.greenAccent;
      case PokemonType.normal:
        return Colors.grey;
      case PokemonType.electric:
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }
}

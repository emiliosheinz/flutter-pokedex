import 'package:flutter/material.dart';

enum PokeType {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
}

extension PokeTypeExtension on PokeType {
  Color get color {
    switch (this) {
      case PokeType.grass:
        return Colors.green;
      case PokeType.poison:
        return Colors.purple;
      case PokeType.fire:
        return Colors.orange;
      case PokeType.flying:
        return Colors.blue;
      case PokeType.water:
        return Colors.blueAccent;
      case PokeType.bug:
        return Colors.greenAccent;
      case PokeType.normal:
        return Colors.grey;
      case PokeType.electric:
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }
}

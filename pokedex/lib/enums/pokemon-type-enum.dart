import 'package:flutter/material.dart';

enum PokeTypeEnum {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
}

extension PokeTypeEnumExtension on PokeTypeEnum {
  Color get color {
    switch (this) {
      case PokeTypeEnum.grass:
        return Colors.green;
      case PokeTypeEnum.poison:
        return Colors.purple;
      case PokeTypeEnum.fire:
        return Colors.orange;
      case PokeTypeEnum.flying:
        return Colors.blue;
      case PokeTypeEnum.water:
        return Colors.blueAccent;
      case PokeTypeEnum.bug:
        return Colors.greenAccent;
      case PokeTypeEnum.normal:
        return Colors.grey;
      case PokeTypeEnum.electric:
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }
}

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

  String get icon {
    switch (this) {
      case PokeTypeEnum.grass:
        return 'assets/images/grass.png';
      case PokeTypeEnum.poison:
        return 'assets/images/poison.png';
      case PokeTypeEnum.fire:
        return 'assets/images/fire.png';
      case PokeTypeEnum.flying:
        return 'assets/images/flying.png';
      case PokeTypeEnum.water:
        return 'assets/images/water.png';
      case PokeTypeEnum.bug:
        return 'assets/images/bug.png';
      case PokeTypeEnum.normal:
        return 'assets/images/normal.png';
      case PokeTypeEnum.electric:
        return 'assets/images/electric.png';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case PokeTypeEnum.grass:
        return 'Grass';
      case PokeTypeEnum.poison:
        return 'Poison';
      case PokeTypeEnum.fire:
        return 'Fire';
      case PokeTypeEnum.flying:
        return 'Flying';
      case PokeTypeEnum.water:
        return 'Water';
      case PokeTypeEnum.bug:
        return 'Bug';
      case PokeTypeEnum.normal:
        return 'Normal';
      case PokeTypeEnum.electric:
        return 'Electric';
      default:
        return '';
    }
  }
}

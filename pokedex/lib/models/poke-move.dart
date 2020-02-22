import 'package:pokedex/enums/pokemon-type-enum.dart';

class PokeMoveModel {
  String name;
  PokeTypeEnum type;

  PokeMoveModel({name, type})
      : name = capitalizeFirstLetter(name),
        type = type;

  static capitalizeFirstLetter(String s) {
    return '${s[0].toUpperCase()}${s.substring(1)}';
  }
}

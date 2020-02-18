import 'package:pokedex/enums/pokemon-type-enum.dart';

class PokeMoveModel {
  String name;
  PokeTypeEnum type;

  PokeMoveModel({name, type})
      : name = name,
        type = type;
}

import 'package:pokedex/enums/pokemon-type-enum.dart';

class PokemonModel {
  String name;
  String id;
  String image;
  List<PokeTypeEnum> types;

  PokemonModel.fromJson(Map jsonMap, List<PokeTypeEnum> types)
      : name = jsonMap['name'],
        id = jsonMap['id'],
        image = jsonMap['image'],
        types = types;

  static getEnumIndexFromPokeType(String type) {
    int index;
    PokeTypeEnum.values.forEach((pok) {
      if (pok.toString().endsWith(type)) {
        index = pok.index;
        return;
      }
    });

    return index;
  }
}

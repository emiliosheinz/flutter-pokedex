import 'package:dio/dio.dart';

class PokeApi {
  Future<Response> _getHttp(url) {
    try {
      return Dio().get(url);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response> listPokemons() {
    return _getHttp('http://localhost:3000/list');
  }

  Future<Response> getPokemonDetails(String pokeId) {
    return _getHttp('http://localhost:3000/details/$pokeId');
  }
}

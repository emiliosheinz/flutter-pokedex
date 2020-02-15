import 'package:flutter/material.dart';

class PokeStat {
  String name;
  int value;
  Color color;

  PokeStat.fromJson(Map jsonMap, Color color)
      : name = jsonMap['name'],
        value = jsonMap['value'],
        color = color;
}

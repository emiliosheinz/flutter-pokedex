import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/poke-stat.dart';

class PokeStatRow extends StatelessWidget {
  final PokeStat stat;
  final GlobalKey progressBarKey = GlobalKey();

  PokeStatRow({@required this.stat});

  _calculateBarWidth() {
    final keyContext = progressBarKey.currentContext;

    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      return box.size.width * (stat.value / 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.addPostFrameCallback(_calculateBarWidth);
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 30,
            child: Text(
              stat.name.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: stat.color,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 10,
            child: Text(
              stat.value.toString(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 60,
            child: Container(
              key: progressBarKey,
              height: 10,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: _calculateBarWidth(),
                decoration: BoxDecoration(
                  color: stat.color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

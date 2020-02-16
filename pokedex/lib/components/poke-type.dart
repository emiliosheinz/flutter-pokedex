import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon-type-enum.dart';

class PokeType extends StatelessWidget {
  final PokeTypeEnum type;
  final bool isMinimalist;

  PokeType({@required this.type, this.isMinimalist = true});

  @override
  Widget build(BuildContext context) {
    double sidePaddig = isMinimalist ? 8 : 15;

    return Container(
      padding: EdgeInsets.fromLTRB(sidePaddig, 8, sidePaddig, 8),
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: type.color,
        boxShadow: [
          BoxShadow(
            color: type.color,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 1,
          )
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 15.0,
          minWidth: 15.0,
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Image.asset(type.icon),
              isMinimalist
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        type.name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

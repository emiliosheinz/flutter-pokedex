import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/poke-list.dart';
import 'package:pokedex/pages/poke-moves.dart';
import 'package:pokedex/res/my-colors.dart';

class PokeHomePage extends StatefulWidget {
  @override
  _PokeHomePageState createState() => _PokeHomePageState();
}

class _PokeHomePageState extends State<PokeHomePage> {
  int _index = 0;

  _renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Pokemon',
        style: TextStyle(color: Colors.black87),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              MyColors.appBar01.withOpacity(0.6),
              MyColors.appBar02.withOpacity(0.6),
              MyColors.appBar03.withOpacity(0.6),
              MyColors.appBar04.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  _renderBody() {
    switch (_index) {
      case 0:
        return PokeListPage();
      case 1:
        return PokeMovesPage();
      default:
        return Center(
          child: Text('NOT IMPLEMENTED'),
        );
    }
  }

  _renderBottomTab() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.appBar01.withOpacity(0.8),
      selectedItemColor: Colors.black,
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/ns_pokemon.png',
              ),
            ),
          ),
          activeIcon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/pokemon.png'),
          ),
          title: Text('Pokemon'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/cd.png'),
          ),
          activeIcon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/sl_disc.png'),
          ),
          title: Text('Moves'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/kandy.png'),
          ),
          activeIcon: SizedBox(
            height: 35,
            width: 35,
            child: Image.asset('assets/images/sl_kandy.png'),
          ),
          title: Text('Items'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _renderBody(),
      ),
      bottomNavigationBar: _renderBottomTab(),
    );
  }
}

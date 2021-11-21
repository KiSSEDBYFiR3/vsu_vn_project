import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';

void main() {
  runApp(const GameStart());
}

class GameStart extends StatefulWidget {
  const GameStart({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GameStartState();
}

class GameStartState extends State<GameStart> {
  void stateSetter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Stack(
        children: [
          backgroundStartImage(),
          gameLogo(),
          gameName(),
          gameButtons(),
        ],
      )),
    ));
  }

  Widget gameLogo() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 0),
      child: Image.asset('assets/chaos_star.png'),
    );
  }

  Widget backgroundStartImage() {
    return Center(child: Image.asset('assets/wastelands.jpg'));
  }

  Widget gameButtons() {
    return MaterialApp(
        home: Builder(
            builder: (context) =>
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      // ignore: prefer_const_constructors
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(250, 129, 00, 0.07),
                          fixedSize: const Size(450, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      icon: Icon(Icons.play_circle_outline_outlined,
                          color: Colors.red.shade900, size: 44),
                      label: const Text(
                        'Новая игра',
                        style: TextStyle(color: Colors.white70, fontSize: 48),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const MyGame());
                        Navigator.of(context).push(route);
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(450, 60),
                            primary: const Color.fromRGBO(250, 129, 00, 0.07),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        icon: Icon(Icons.play_circle_fill_outlined,
                            color: Colors.red.shade900, size: 44),
                        label: const Text(
                          'Загрузка',
                          style: TextStyle(color: Colors.white70, fontSize: 48),
                        ),
                        onPressed: () {},
                      )),
                  Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(450, 60),
                            primary: const Color.fromRGBO(250, 129, 00, 0.07),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        icon: Icon(Icons.close,
                            color: Colors.red.shade900, size: 44),
                        label: const Text(
                          'Выйти из игры',
                          style: TextStyle(color: Colors.white70, fontSize: 48),
                        ),
                        onPressed: () => SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop')),
                  )
                ])));
  }

  Widget gameName() {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 200),
      child: Text(
        'Shadows of Chaos',
        style: TextStyle(
            fontSize: 130,
            fontFamily: 'Celexa',
            color: Colors.red.shade900,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

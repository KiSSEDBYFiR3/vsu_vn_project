import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyGameState();
}

int cardNum = 0;
int msgNum = 0;
String currentCharacter = "";
String currentMessage = "";
var currentCharacterImage = "";
var currentScenary = "";

class MyGameState extends State<MyGame> {
//функция переопределяюзаяя основные переменные и дающая понять виджету, что его состояние изменилось

  Map data = {};
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final response = await rootBundle.loadString('assets/jsonFiles/model.json');
    setState(() {
      data = jsonDecode(response);
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

  void nextCardNum() {
    setState(() {
      if (msgNum == data['cards'][cardNum]['dialogueMessage'].length - 1) {
        msgNum = 0;
        cardNum++;
      } else {
        msgNum++;
      }
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

  @override
  //создаем стэк, в который передаем остальные виджеты для вывода на экран
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Stack(
          children: [
            backgroundScenary(),
            currentCharacterWidget(),
            dialogueWindow(),
            textMessage(),
            characterName(),
            nextButton()
          ],
        ),
      )),
    );
  }

  Widget backgroundScenary() {
    return Center(child: Image.asset(currentScenary));
  }

// виджет выводящий диалоговое окно
  Widget dialogueWindow() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 30),
      alignment: Alignment.bottomLeft,
      child: Image.asset('assets/dialogue-box.png'),
    );
  }

// виджет выводящий текущий текст диалога
// margin: const EdgeInsets.only(left: 50, right: 30, bottom: 100, top: 750),
  Widget textMessage() {
    return Container(
      width: 1200,
      margin: const EdgeInsets.only(left: 50, right: 30, bottom: 100, top: 750),
      alignment: Alignment.topLeft,
      child: Text(
        currentMessage,
        textAlign: TextAlign.left,
        textScaleFactor: 1.5,
        style: const TextStyle(color: Colors.grey, fontFamily: 'IMFellEnglish'),
      ),
    );
  }

// виджет выводящий в диалоговое окно имя персонажа
// margin: const EdgeInsets.only(left: 40, right: 30, bottom: 250),
  Widget characterName() {
    return Container(
      height: 720,
      margin: const EdgeInsets.only(left: 40, right: 30, bottom: 250),
      alignment: Alignment.bottomLeft,
      child: Text(
        currentCharacter,
        textAlign: TextAlign.left,
        textScaleFactor: 2.2,
        style:
            const TextStyle(color: Colors.white70, fontFamily: 'IMFellEnglish'),
      ),
    );
  }

// виджет  выводящий на экран изображение персонажа
  Widget currentCharacterWidget() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.asset(currentCharacterImage),
    );
  }

// виджет-конпка 'далее', которая задействует обновляет переменные и состояние основного виджета
// const EdgeInsets.only(right: 400, bottom: 20, top: 910, left: 1330) для монитора
// const EdgeInsets.only(right: 200, bottom: 20, top: 680, left: 1200) для ноутбука
  Widget nextButton() {
    return Container(
        color: Colors.grey,
        margin:
            const EdgeInsets.only(right: 400, bottom: 20, top: 910, left: 1330),
        child: OutlinedButton(
          onPressed: nextCardNum,
          child: const Text("Далее", style: TextStyle(fontSize: 35)),
        ));
  }
}

import 'package:flutter/material.dart';
import 'model.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyGameState();
}

int cardNum = 0;

String currentCharacter = cardSelector[cardNum].getCharacterName;
String currentMessage = cardSelector[cardNum].getDialogueMessage;

var currentCharacterImage = cardSelector[cardNum].getCharacterImage;
var currentScenary = cardSelector[cardNum].getBackgroundImage;

class MyGameState extends State<MyGame> {
//функция переопределяюзаяя основные переменные и дающая понять виджету, что его состояние изменилось
  void nextCardNum() {
    setState(() {
      cardNum = cardSelector[cardNum].getNextCardNumber;
      currentCharacter = cardSelector[cardNum].getCharacterName;
      currentMessage = cardSelector[cardNum].getDialogueMessage;
      currentCharacterImage = cardSelector[cardNum].getCharacterImage;
      currentScenary = cardSelector[cardNum].getBackgroundImage;
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
            currentScenary,
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
      child: currentCharacterImage,
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

import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
List choisesList = [];

class MyGameState extends State<MyGame> {
  Map data = {};
//внутрененее состояние класса незменяемое при каждом измении основного состоянии программы
  @override
  void initState() {
    fetchData();
    super.initState();
  }

//конструктор, получающий данные из json файла
  Future<void> fetchData() async {
    final response = await rootBundle.loadString('assets/jsonFiles/model.json');
    setState(() {
      data = jsonDecode(response);
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
      choisesList = data['cards'][cardNum]['choises'].toList();
    });
  }

  void option1() {
    setState(() {
      cardNum = data['cards'][cardNum]['choises'][0]['nextId'];
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

  void option2() {
    setState(() {
      cardNum = data['cards'][cardNum]['choises'][1]['nextId'];
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

  void option3() {
    setState(() {
      cardNum = data['cards'][cardNum]['choises'][2]['nextId'];
      currentCharacter = data['cards'][cardNum]['characterName'];
      currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
      currentCharacterImage = data['cards'][cardNum]['characterImage'];
      currentScenary = data['cards'][cardNum]['backgroundImage'];
    });
  }

// функция создающая диалоговые окна
  _openDialogue(BuildContext context) async {
    switch (await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // ignore: prefer_const_constructors
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.0),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Option 1");
                },
                child: Text(data["cards"][cardNum]["choises"][0]['optionText'],
                    style: const TextStyle(
                        color: Color.fromRGBO(247, 208, 84, 0.6),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Courier New')),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Option 2");
                },
                child: Text(data["cards"][cardNum]["choises"][1]['optionText'],
                    style: const TextStyle(
                        color: Color.fromRGBO(247, 208, 84, 0.6),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Courier New')),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Option 3");
                },
                child: Text(data["cards"][cardNum]["choises"][2]['optionText'],
                    style: const TextStyle(
                        color: Color.fromRGBO(247, 208, 84, 0.6),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Courier New')),
              )
            ],
          );
        })) {
      case "Option 1":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][0]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
      case "Option 2":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][1]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
      case "Option 3":
        setState(() {
          cardNum = data['cards'][cardNum]['choises'][2]['nextId'];
          currentCharacter = data['cards'][cardNum]['characterName'];
          currentMessage = data['cards'][cardNum]['dialogueMessage'][msgNum];
          currentCharacterImage = data['cards'][cardNum]['characterImage'];
          currentScenary = data['cards'][cardNum]['backgroundImage'];
        });
        break;
    }
  }

//функция изменяющая состояние виджета и переопределяющая переменные
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
            nextButton(),
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
  Widget textMessage() {
    return Container(
      width: 1200,
      margin: const EdgeInsets.only(left: 50, right: 30, bottom: 100, top: 750),
      alignment: Alignment.topLeft,
      child: Text(
        currentMessage,
        textAlign: TextAlign.left,
        textScaleFactor: 1.5,
        style: const TextStyle(color: Colors.grey, fontFamily: 'Courier New'),
      ),
    );
  }

// виджет выводящий в диалоговое окно имя персонажа
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
            const TextStyle(color: Colors.white70, fontFamily: 'Courier New'),
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

// виджет-конпка 'далее', которая задействует функцию nextCardNum, которая обновляет переменные и состояние основного виджета
  Widget nextButton() {
    return Container(
        color: Colors.grey,
        margin:
            const EdgeInsets.only(right: 400, bottom: 20, top: 910, left: 1330),
        child: OutlinedButton(
          onPressed: () {
            data['cards'][cardNum]['choises'].isEmpty
                ? nextCardNum()
                : _openDialogue(context);
          },
          child: const Text("Далее", style: TextStyle(fontSize: 35)),
        ));
  }
}

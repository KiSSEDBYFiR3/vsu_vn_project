import 'package:flutter/material.dart';

class Card0 {
  String getDialogueMessage = '''
  Тебе стоит понять одну простую вещь, Крис. Разумное существо без души все равно, что машина без двигателя - красивая, но по сути своей, лишь пустая оболочка.
   
  ''';
  String getCharacterName = 'Рейчел';
  final getCharacterImage = Image.asset('assets/woman.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 1;
}

class Card1 {
  String getDialogueMessage = ''' 
  Душа - изначально источник и хранилище всех исходных человеческих эмоции. Можно было бы сказать, что нет души - нет и эмоции, но это не совсем так...
   
  ''';
  String getCharacterName = 'Рейчел';
  final getCharacterImage = Image.asset('assets/woman.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 2;
}

class Card2 {
  String getDialogueMessage = ''' 
  Чем старше человек, тем больше 'внешние' эмоции, поступающиее из души укрепляются в его внутреннем сознании. Но как бы то ни было это лишь верхушка айсберга. Убери душу и человек по большей части станет пустышкой - отголоском самого себя. 
  
  
  ''';
  String getCharacterName = 'Рейчел';
  final getCharacterImage = Image.asset('assets/woman.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 3;
}

class Card3 {
  String getDialogueMessage = '''
  Тогда почему я все еще ощущаю эмоции? По твоим словам, у меня осталось менее пяти процентов души, а это, переводя на нормальный язык, практически равно полному ее отсутствию. Но тем не менее я все еще способен чувствовать и воспринимать мир таким, какой он есть.    
  ''';
  String getCharacterName = 'Крис';
  final getCharacterImage = Image.asset('assets/os_disgust.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 4;
}

class Card4 {
  String getDialogueMessage = '''
  Она лишь хмыкнула мне в ответ, словно смеясь над несмышленным ребенком. 
   
   - Это так не работает. Ничего не берется из ниоткуда и не исчезает бесследно в никуда. Ну в большинстве случаев, по крайней мере... Возьми тот же заменитый Закон Сохранения Энергии. Уловил суть? То же самое и с твоими эмоциями.
  ''';
  String getCharacterName = 'Рейчел';
  final getCharacterImage = Image.asset('assets/woman.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 5;
}

class Card5 {
  String getDialogueMessage = '''
  Ты не можешь в один момент превратиться в бесчувственного овоща. Этот процесс будет проходить постепенно. Ты и сам, вероятно, уже почувствол, что что-то в тебе изменилось. Со временем будет только хуже.
  ''';
  String getCharacterName = 'Рейчел';
  final getCharacterImage = Image.asset('assets/woman.png');
  final getBackgroundImage = Image.asset('assets/scenary1.png');
  int getNextCardNumber = 6;
}

class Card6 {
  String getDialogueMessage = '''
  Маги несколько отличаются от простых людей. Зачастую, и внешне и внутренне. И если внешне это можно объянить мутациями, вызванными экстримальным содержанием магии в теле, свзями со Старшими Рассами в прошлом или начавшейся Небесной Эволюцией, то с внутренними отличиями не все так просто... 
  ''';
  String getCharacterName = 'Анабель';
  final getCharacterImage = Image.asset('assets/sprite.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  int getNextCardNumber = 7;
}

class Card7 {
  String getDialogueMessage = '''
  Представь себе нервную систему обычного человека. У Мага она также будет - все-таки мы близковидовые расы - но в довесок к ней идет еще одна. Она не имеет физического воплощения, лишь концептуальное. Магические связи, Контуры, Каналы - называют ее по разному, но сути это не меняет. Их основная функция - накапливать и проводить сквозь тело магическую энергию.
  ''';
  String getCharacterName = 'Анабель';
  final getCharacterImage = Image.asset('assets/sprite.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  int getNextCardNumber = 0;
}

class Card8 {
  String getDialogueMessage = '''
  Мне стало интересно...
  ''';
  String getResponseMessage_1 =
      "Ты уже несколько раз упомянала Небесную Эволюцию...";
  String getResponseMessage_2 =
      "Каким образом что-то не имеющее физического воплощения накапливать энергию?";
  String getResponseMessage_3 = "Как вообще появились первые маги?";
  String getCharacterName = 'Крис';
  final getCharacterImage = Image.asset('assets/os_disgust.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  List<int> getNextCardNumber = [9, 10, 11];
}

class Card9 {
  String getDialogueMessage = '''
  Хах, интересные, однако, ты задаешь вопросы! 
  ''';
  String getCharacterName = 'Анабель';
  final getCharacterImage = Image.asset('assets/sprite.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  int getNextCardNumber = 0;
}

class Card10 {
  String getDialogueMessage = '''
  Чтож... Магия - истинная магия - несколько отличается от человеческой науки. Магические контуры в первую очередь являются связывающими элементами с Великими Арканами. Концепт - это понятие порядка выше восприятия обычного человека. Оно не имеет физического воплощения, потому что оно ему не нужно. Концептуальное состояние имеет уровень доступа к энергиям высшего порядка. Хоть и простые маги не могут их контролировать, но сути это не меняет. 
  ''';
  String getCharacterName = 'Анабель';
  final getCharacterImage = Image.asset('assets/sprite.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  int getNextCardNumber = 0;
}

class Card11 {
  String getDialogueMessage = '''
 Никто не уверен на сто процентов. Споры в магическом сообществе идут до сих пор. Выдвигаются теории, строятся домыслы один безумнее другого. Многие считают, что магии людей обучили Старшие Народы, но кто обучил их? Ведь в этом и есть суть вопроса, так? Лично я придерживаюсь Классической теории. Магия не всегда была такой какая она сейчас. Раньше - тысячи лет назад - были страшные времена Крис. Эпохо богов. Мир был другим, законы были другими, магия была другой...''';
  String getCharacterName = 'Анабель';
  final getCharacterImage = Image.asset('assets/sprite.png');
  final getBackgroundImage = Image.asset('assets/scenary2.png');
  int getNextCardNumber = 0;
}

List<dynamic> cardSelector = [
  Card0(),
  Card1(),
  Card2(),
  Card3(),
  Card4(),
  Card5(),
  Card6(),
  Card7(),
];

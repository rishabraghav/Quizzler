

import 'questionbank.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<QuestionBank> _questionBank = [
    QuestionBank(q: 'Seahorses have stomachs for the absorption of nutrients from food.', a: false),
    QuestionBank(q: 'The letter H is between letters G and J on a keyboard', a: true),
    QuestionBank(q: 'Camels have three sets of eyelashes', a: true),
    QuestionBank(q: 'There are five zeros in one hundred thousand', a: true),
    QuestionBank(q: 'There are stars and zigzags on the flag of America', a: false),
    QuestionBank(q: 'If you add the two numbers on the opposite sides of dice together, the answer is always 7', a: true),
    QuestionBank(q: 'The moon is just 50 percent of the mass of Earth.', a: false),
    QuestionBank(q: 'Nearly three percent of the ice in Antarctic glaciers is penguin urine.', a: true),
    QuestionBank(q: 'Apes cant laugh.', a: false),
    QuestionBank(q: 'A snail can sleep for three months.', a: false),
    QuestionBank(q: 'Your nose and sinuses produce almost one liter of mucus a day (which you swallow.)', a: true),
    QuestionBank(q: 'Tasting is never determined by what you’re smelling', a: false),
    QuestionBank(q: 'It takes a sloth two weeks to digest its food.', a: true),
    QuestionBank(q: 'You can sneeze during sleep', a: false),
    QuestionBank(q: 'There is a world championship for throwing mobile phones.', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }


  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  void restart() {
    _questionNumber = 0;
  }
}

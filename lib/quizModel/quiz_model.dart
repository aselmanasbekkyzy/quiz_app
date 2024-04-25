class QuizModel {
  const QuizModel(this.question, this.answer);

  final String question;
  final bool answer;
}

const q1 = QuizModel('2+4=6', true);
const q2 = QuizModel('5*4=30', false);
const q3 = QuizModel('9-4=5', true);
const q4 = QuizModel('8*2=18', false);
const q5 = QuizModel('6/2=3', true);
const q6 = QuizModel('23-9=15', false);

List<QuizModel> suroolor = [q1, q2, q3, q4, q5, q6];

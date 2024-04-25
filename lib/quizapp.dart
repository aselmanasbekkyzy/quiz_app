import 'package:flutter/material.dart';
import 'package:quiz_app/quizModel/quiz_model.dart';
import 'package:quiz_app/widgets/birWidget.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int index = 0;
  List<bool> jooptor = [];
  List<bool> tuuraJooptor = [];
  List<bool> kataJooptor = [];

  void teksher({required bool joop}) {
    if (suroolor[index].answer == joop) {
      jooptor.add(true);
      tuuraJooptor.add(true);
    } else {
      jooptor.add(false);
      kataJooptor.add(false);
    }
    setState(() {
      if (suroolor[index] == suroolor.last) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тесттин жообу'),
              content: Text(
                'Жалпы суроолордук саны: ${jooptor.length}\n'
                'Туура жооптор: ${tuuraJooptor.length}\n'
                'Ката жооптор: ${kataJooptor.length}\n',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Кайра баштоо'),
                  onPressed: () {
                    setState(() {
                      index = 0;
                      jooptor.clear();
                      tuuraJooptor.clear();
                      kataJooptor.clear();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 43),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 63),
              child: Text(
                suroolor[index].question,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            BirWidget(
              baskanda: (value) {
                teksher(joop: value);
              },
              isTrue: true,
            ),
            const SizedBox(
              height: 10,
            ),
            BirWidget(
              baskanda: (value) {
                teksher(joop: value);
              },
              isTrue: false,
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: jooptor.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return jooptor[index] == true
                            ? const ResultButton(
                                isTrue: true,
                              )
                            : const ResultButton(
                                isTrue: false,
                              );
                      }),
                ),
             const   SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  const ResultButton({super.key, required this.isTrue});
  final bool isTrue;
  @override
  Widget build(BuildContext context) {
    return Icon(
      isTrue == true ? Icons.check : Icons.close,
      color: isTrue == true ? Colors.green : Colors.red,
      size: 35,
    );
  }
}

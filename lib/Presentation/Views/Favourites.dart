import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/Presentation/Views/QuizPage.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  void moveToQuiz(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        const QuizPage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          ElevatedButton(onPressed: () {
            moveToQuiz(context);
          },
            child: Text('level 1'),
          ),
          ElevatedButton(onPressed: () {
            moveToQuiz(context);
          },
            child: Text('level 4'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pop(context);},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../Model/Answer.dart';
import '../Model/Question.dart';
import '../API/APICauLiet.dart';
class CauLiet extends StatefulWidget {
  const CauLiet({super.key});

  @override
  _CauLietState createState() => _CauLietState();
}

class _CauLietState extends State<CauLiet> {
  Future<List<Question>>? quizData;

  @override
  void initState() {
    super.initState();
    quizData = fetchQuizCauLiet();
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câu liệt'),
      ),
      body: FutureBuilder<List<Question>>(
        future: quizData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Question> questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, questionIndex) {
                Question question = questions[questionIndex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${questionIndex + 1}. ${question.questionText}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      if (question.imageUrl != null && question.imageUrl!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter, 
                              heightFactor: 0.6, 
                              child: Image.network(
                                question.imageUrl!,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text('Unable to load image');
                                },
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(question.answers.length, (answerIndex) {
                          Answer answer = question.answers[answerIndex];
                          
                          String answerLabel = String.fromCharCode(97 + answerIndex);
                          return ListTile(
                            leading: Text(
                              '$answerLabel)',
                              style: const TextStyle(fontSize: 16),
                            ),
                            title: Text(
                              answer.answerText,
                              style: TextStyle(
                                fontSize: 16,
                                color: answer.correct ? Colors.red : Colors.black,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

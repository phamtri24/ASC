import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Question.dart';
import '../Model/Answer.dart';

Future<List<Question>> fetchQuizBienBao() async {
  final response = await http.get(Uri.parse('https://2815-113-161-66-197.ngrok-free.app/QnACar2/api/v1/questions/category=6')); // Thay API URL vào đây

  if (response.statusCode == 200) {
    String utf8Body = utf8.decode(response.bodyBytes);
    
    List<dynamic> data = jsonDecode(utf8Body);
    
    return data.map((item) {
      List<Answer> answers = (item['answers'] as List<dynamic>)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList();

      return Question(
        questionId: item['questionId'].toString(),  
        questionText: item['questionText'] as String,
        imageUrl: item['imageUrl'],  
        answers: answers,  
      );
    }).toList();
  } else {
    throw Exception('Failed to load quiz');
  }
}

import 'Answer.dart';
class Question {
  String questionId;
  String questionText;
  String? imageUrl;  // Có thể null
  List<Answer> answers;

  Question({
    required this.questionId,
    required this.questionText,
    this.imageUrl,
    required this.answers,
  });

  // Tạo phương thức fromJson nếu cần
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['questionId'].toString(),
      questionText: json['questionText'] as String,
      imageUrl: json['imageUrl'] as String?,
      answers: (json['answers'] as List)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList(),
    );
  }
}
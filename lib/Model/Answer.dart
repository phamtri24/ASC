class Answer {
  String answerId;
  String answerText;
  bool correct;

  Answer({
    required this.answerId,
    required this.answerText,
    required this.correct,
  });

  // Chuyển đổi từ JSON sang Answer
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answerId: json['answerId'].toString(),  // Chuyển `answerId` từ int sang String
      answerText: json['answerText'] as String,
      correct: json['correct'] as bool,
    );
  }
}
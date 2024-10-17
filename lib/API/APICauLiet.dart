import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Question.dart'; // Mô hình câu hỏi
import '../Model/Answer.dart'; // Mô hình câu trả lời

Future<List<Question>> fetchQuizCauLiet() async {
  final response = await http.get(Uri.parse('https://7741-113-161-66-197.ngrok-free.app/QnACar2/api/v1/questions/is_critical=1')); // Thay API URL vào đây

  if (response.statusCode == 200) {
    // Đảm bảo nội dung trả về được giải mã theo chuẩn UTF-8
    String utf8Body = utf8.decode(response.bodyBytes);
    
    // Giải mã dữ liệu JSON
    List<dynamic> data = jsonDecode(utf8Body);
    
    // Chuyển đổi dữ liệu từ JSON thành đối tượng `Question` và `Answer`
    return data.map((item) {
      // Lấy danh sách câu trả lời từ JSON
      List<Answer> answers = (item['answers'] as List<dynamic>)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList();

      // Trả về đối tượng `Question`
      return Question(
        questionId: item['questionId'].toString(),  // Chuyển `questionId` từ int sang String nếu cần
        questionText: item['questionText'] as String,
        imageUrl: item['imageUrl'],  // Có thể null
        answers: answers,  // Danh sách các câu trả lời
      );
    }).toList();
  } else {
    throw Exception('Failed to load quiz');
  }
}

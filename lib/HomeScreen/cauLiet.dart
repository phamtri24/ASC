import 'package:flutter/material.dart';
import '../Model/Answer.dart';
import '../Model/Question.dart'; // Thay bằng đường dẫn thực tế tới model Question
import '../API/APICauLiet.dart'; // Thay bằng file chứa API của bạn

class CauLiet extends StatefulWidget {
  @override
  _CauLietState createState() => _CauLietState();
}

class _CauLietState extends State<CauLiet> {
  Future<List<Question>>? quizData;

  @override
  void initState() {
    super.initState();
    quizData = fetchQuizCauLiet(); // Gọi API lấy danh sách câu hỏi
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Câu liệt'),
      ),
      body: FutureBuilder<List<Question>>(
        future: quizData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
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
                      // Hiển thị câu hỏi với số thứ tự
                      Text(
                        '${questionIndex + 1}. ${question.questionText}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      // Kiểm tra nếu có hình ảnh
                      if (question.imageUrl != null && question.imageUrl!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter, // Căn ảnh từ trên xuống
                              heightFactor: 0.6, // Giữ 80% chiều cao của ảnh, cắt 20% phía dưới
                              child: Image.network(
                                question.imageUrl!,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text('Unable to load image'); // Thông báo lỗi nếu không load được ảnh
                                },
                                width: MediaQuery.of(context).size.width, // Full chiều ngang màn hình
                                height: 200, // Chiều cao của ảnh, bạn có thể tùy chỉnh
                                fit: BoxFit.cover, // Đảm bảo ảnh bao phủ toàn bộ chiều ngang
                              ),
                            ),
                          ),
                        ),
                      
                      // Hiển thị danh sách câu trả lời với các ký tự a,b,c,...
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(question.answers.length, (answerIndex) {
                          Answer answer = question.answers[answerIndex];
                          
                          // Convert index to 'a', 'b', 'c', ...
                          String answerLabel = String.fromCharCode(97 + answerIndex); // 'a' -> 97

                          return ListTile(
                            leading: Text(
                              '$answerLabel)', // Hiển thị a, b, c, ...
                              style: TextStyle(fontSize: 16),
                            ),
                            title: Text(
                              answer.answerText,
                              style: TextStyle(
                                fontSize: 16,
                                color: answer.correct ? Colors.red : Colors.black, // Đáp án đúng tô màu đỏ
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

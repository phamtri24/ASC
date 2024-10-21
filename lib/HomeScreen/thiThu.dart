import 'package:flutter/material.dart';
import '../Model/Question.dart';
import '../API/APIB1.dart'; // Đường dẫn tới hàm fetchQuiz

class thiThuB1 extends StatefulWidget {
  @override
  _thiThuB1State createState() => _thiThuB1State();
}

class _thiThuB1State extends State<thiThuB1> {
  late Future<List<Question>> futureQuiz;
  Map<int, String?> selectedAnswers = {}; // Lưu câu trả lời đã chọn của người dùng

  @override
  void initState() {
    super.initState();
    futureQuiz = fetchQuizB1();
  }

  void submitQuiz() {
    // Logic xử lý khi người dùng nộp bài
    // Ở đây bạn có thể tính điểm hoặc hiển thị kết quả
    print("Câu trả lời đã chọn: $selectedAnswers");
    // Bạn có thể hiển thị một dialog hoặc chuyển sang màn hình khác để hiển thị kết quả
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trắc Nghiệm'),
      ),
      body: FutureBuilder<List<Question>>(
        future: futureQuiz,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có câu hỏi nào.'));
          }

          List<Question> questions = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (questions[index].imageUrl != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.network(
                                  questions[index].imageUrl!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                              ),
                            Text(
                              '${index + 1}. ${questions[index].questionText}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            ...questions[index].answers.map((answer) {
                              return ListTile(
                                title: Text(answer.answerText),
                                leading: Radio<String?>(
                                  value: answer.answerId,
                                  groupValue: selectedAnswers[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAnswers[index] = value;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: submitQuiz,
                  child: Text('Nộp Bài'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Chiều rộng đầy đủ
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

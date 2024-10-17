import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: thiTheoDe(),
  ));
}

class thiTheoDe extends StatelessWidget {
  const thiTheoDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'THI THEO ĐỀ̀',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto-Bold',
              fontSize: 22,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF2352AB),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
              ),
            )
          ],
        ),),
    );
  }
}

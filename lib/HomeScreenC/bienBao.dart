import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: bienBao(),
  ));
}

class bienBao extends StatelessWidget {
  const bienBao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'BIỂN BÁO B2',
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF2352AB),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
              ),
            )
          ],
        ),),
    );
  }
}

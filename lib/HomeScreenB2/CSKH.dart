import 'package:flutter/material.dart';
import '../HomeScreenAll/CSKH_All.dart';

void main() {
  runApp(const MaterialApp(
    home: CSKH(),
  ));
}

class CSKH extends StatelessWidget {
  const CSKH({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'CHĂM SÓC KHÁCH HÀNG',
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
          children: const [
            CskhAll(),
          ],
        ),
      ),
    );
  }
}

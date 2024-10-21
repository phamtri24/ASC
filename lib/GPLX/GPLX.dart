import '../GPLX/B1Screen.dart';
import '../GPLX/B2Screen.dart';
import '../GPLX/CScreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GPLX(),
  ));
}

class GPLX extends StatelessWidget {
  const GPLX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Chọn loại GPLX',
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  _buildButton(context, 'B1'),
                  _buildButton(context, 'B2'),
                  _buildButton(context, 'C'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildButton(BuildContext context, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2352AB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        elevation: 5,
      ),
      onPressed: () {
        switch (text) {
          case 'B1':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const B1screen(title: "GPLX B1",)),
            );
            break;
          case 'B2':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const B2screen(title: "GPLX B2")),
            );
            break;
          case 'C':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cscreen(title: "GPLX C")),
            );
            break;
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}




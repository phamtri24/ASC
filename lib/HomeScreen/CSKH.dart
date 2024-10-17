import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
        title: Center(
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF2352AB),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Hỗ trợ kỹ thuật : support@ascvn.com.vn "
                    "\nHotline hỗ trợ : (028) 66.797.357 "
                    "\nYêu cầu chung: contact@ascvn.com.vn",
                  style: TextStyle(color: Colors.white),)
              ),
            )
          ],
        ),),
    );
  }
}

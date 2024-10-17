import 'package:flutter/material.dart';
import '../HomeScreen/CSKH.dart';
import '../HomeScreenC/bienBao.dart';
import '../HomeScreenC/cauLiet.dart';
import '../HomeScreenC/cauSai.dart';
import '../HomeScreenC/lyThuyet.dart';
import '../HomeScreenC/meo.dart';
import '../HomeScreenC/saHinh.dart';
import '../HomeScreenC/thiTheoDe.dart';
import '../HomeScreenC/thiThu.dart';
class Cscreen extends StatelessWidget {
  final String title;
  const Cscreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontFamily: 'Roboto-Bold'),
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
                color: Color(0xFF2352AB),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iTem('THI THỬ', 'assets/images/exam.png', context, thiThu()),
                      iTem('THI THEO ĐỀ', 'assets/images/openbook.png', context, thiTheoDe()),
                      iTem('CÂU SAI', 'assets/images/close.png', context, cauSai()),
                      iTem('BIỂN BÁO', 'assets/images/bienbao.png', context, bienBao()),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iTem('LÝ THUYẾT', 'assets/images/book.png', context, lyThuyet()),
                      iTem('MẸO', 'assets/images/idea.png', context, meo()),
                      iTem('CÂU LIỆT', 'assets/images/erro.png', context, cauLiet()),
                      iTem('SA HÌNH', 'assets/images/shapes.png', context, saHinh()),
                    ],
                  )

                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 500,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CSKH()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2352AB),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "CHĂM SÓC KHÁCH HÀNG",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Roboto-Bold',
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget iTem(String label, String iconPath, BuildContext context, Widget page) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Image.asset(
                iconPath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Roboto-Bold',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

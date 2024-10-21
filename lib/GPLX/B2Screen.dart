import 'package:flutter/material.dart';
import '../HomeScreen/CSKH.dart';
import '../HomeScreenB2/bienBao.dart';
import '../HomeScreenB2/cauLiet.dart';
import '../HomeScreenB2/cauSai.dart';
import '../HomeScreenB2/lyThuyet.dart';
import '../HomeScreenB2/meo.dart';
import '../HomeScreenB2/saHinh.dart';
import '../HomeScreenB2/thiTheoDe.dart';
import '../HomeScreenB2/thiThu.dart';
class B2screen extends StatelessWidget {
  final String title;
  const B2screen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontFamily: 'Roboto-Bold'),
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
                color: const Color(0xFF2352AB),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iTem('THI THỬ', 'assets/images/exam.png', context, const thiThu()),
                      iTem('THI THEO ĐỀ', 'assets/images/openbook.png', context, const thiTheoDe()),
                      iTem('CÂU SAI', 'assets/images/close.png', context, const cauSai()),
                      iTem('BIỂN BÁO', 'assets/images/bienbao.png', context, const bienBao()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iTem('LÝ THUYẾT', 'assets/images/book.png', context, const lyThuyet()),
                      iTem('MẸO', 'assets/images/idea.png', context, const meo()),
                      iTem('CÂU LIỆT', 'assets/images/erro.png', context, const cauLiet()),
                      iTem('SA HÌNH', 'assets/images/shapes.png', context, const saHinh()),
                    ],
                  )

                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 500,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CSKH()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2352AB),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                iconPath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
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

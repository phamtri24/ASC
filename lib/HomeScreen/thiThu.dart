import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: thiThu(),
  ));
}

class thiThu extends StatelessWidget {
  const thiThu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'THI THỬ',
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
                  color: Color(0xFF2352AB),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2352AB),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "NỘP BÀI",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto-Bold',
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),),
    );
  }
}

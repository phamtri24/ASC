import 'package:flutter/material.dart';

class CskhAll extends StatelessWidget {
  const CskhAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2352AB),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Hotline hỗ trợ: (028) 66.797.357 "
          "\nHỗ trợ kỹ thuật: support@ascvn.com.vn "
          "\nYêu cầu chung: contact@ascvn.com.vn"
          "\nYêu cầu tư vấn: sales@ascvn.com.vn",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

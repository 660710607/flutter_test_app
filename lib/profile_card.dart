import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String imgUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,// กว้างพอดี
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // สีพื้นหลังนุ่ม ๆ
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.redAccent, // สีกรอบเข้ากับ bg
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // รูปด้านบน
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imgUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          // ชื่อด้านล่าง
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey, // สีเข้ากับกรอบ
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Flash Sale!",
            style:  const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "999 บาท",
            style:  const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String text;
  final Color color;

  const TextCard({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color, // ใช้สีตัดกับ ProfileCard
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white, // สีตัวอักษรตัดกับพื้นหลัง
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'text_card.dart';
import 'profile_card.dart';
import 'like_card.dart';
import 'dart:ui'; // for ImageFilter.blur

class GreetingScreen extends StatelessWidget {
  final String name;
  final Color bgColor; // still keep for fallback

  const GreetingScreen({
    super.key,
    required this.name,
    required this.bgColor,
  });

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // 1️⃣ White Background
        SizedBox.expand(
          child: Container(
            color: Colors.white,
          ),
        ),
        
          // 3️⃣ Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextCard(
                  text: "Good M",
                  color: Colors.redAccent,
                ),
                const SizedBox(height: 10),
                const ProfileCard(
                  name: "ขายสกินนี้ครับ",
                  imgUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCXaDUO0shLK66aINVmK3c8sijj1wlBVa4ww&s",
                ),
                const SizedBox(height: 10),
                LikeCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/main.dart';
import 'text_card.dart'; // import local widget

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextCard(
              text: "Growth",
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 10),
            const TextCard(
              text: "Lol",
              color: Colors.orange,
            ),
            const SizedBox(height: 10),
            /*ElevatedButton(
              onPressed: () {
                // ตัวอย่าง navigation กลับหน้าเดิม
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyApp(),
                  ),
                );
              },
              child: const Text("Go to MyApp"),
            ),*/
          ],
        ),
      ),
    );
  }
}

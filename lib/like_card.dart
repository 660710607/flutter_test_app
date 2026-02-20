import 'package:flutter/material.dart';
import 'content_screen.dart'; // import หน้า ContentScreen

class LikeCard extends StatefulWidget {
  const LikeCard({super.key});

  @override
  State<LikeCard> createState() => _LikeCardState();
}

class _LikeCardState extends State<LikeCard> {
  bool isLike = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Left Column: Like / Dislike + Count + Increment
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isLike ? "Liked" : "Dislike",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    icon: Icon(
                      isLike ? Icons.thumb_up : Icons.thumb_down,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                  ),
                  Text(
                    "Count: $count",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                ],
              ),

              // Right Column: Decrement + Reset
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Decrease",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (count > 0) count--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Button ไป ContentScreen
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContentScreen(),
                ),
              );
            },
            child: const Text("Go to ContentScreen"),
          ),
        ],
      ),
    );
  }
}

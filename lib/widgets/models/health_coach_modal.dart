import 'package:flutter/material.dart';

class HealthCoachModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final replies = [
      "Hello! I'm your virtual health coach.",
      "Remember to stretch today!",
      "Stay hydrated and eat clean.",
    ];

    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: Column(
        children: [
          Text("Chat with Coach", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 12),
          ...replies.map((msg) => Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(msg),
            ),
          )),
          Spacer(),
          Text("More features coming soon...", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

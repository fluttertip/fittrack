import 'package:fittrack/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
class ProgressCard extends StatelessWidget {
  final String title;
  final int value;
  final int goal;

  const ProgressCard({required this.title, required this.value, required this.goal});

  @override
  Widget build(BuildContext context) {
    final percent = value / goal;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: AppTextStyles.subheading),
            SizedBox(height: 8),
            CircularProgressIndicator(value: percent, strokeWidth: 6),
            SizedBox(height: 8),
            Text('$value / $goal', style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaterScreen extends StatelessWidget {
  final int glassesDrunk;
  final int goal;
  final VoidCallback onAddWater;

  const WaterScreen({
    Key? key,
    required this.glassesDrunk,
    required this.goal,
    required this.onAddWater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = glassesDrunk / goal;

    return Scaffold(
      appBar: AppBar(title: Text('Water Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/water_fill.json',
                height: 180,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Glasses Drunk: $glassesDrunk / $goal",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(value: progress, minHeight: 10),
            SizedBox(height: 24),
            ElevatedButton.icon(
              icon: Icon(Icons.local_drink),
              label: Text("Add Water"),
              onPressed: onAddWater,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: StadiumBorder(),
              ),
            ),
            Spacer(),
            Text(
              "Tip: Staying hydrated boosts energy and brain function!",
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

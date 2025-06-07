import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HealthTipCarousel extends StatelessWidget {
  final List<String> tips = [
    "💧 Stay hydrated throughout the day.",
    "🚶‍♂️ Take a 10-minute walk every hour.",
    "🍎 Eat more whole foods and fewer processed snacks.",
    "🧘 Practice mindfulness or meditate daily.",
    "🛏️ Get at least 7-8 hours of sleep.",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 110,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        autoPlayInterval: Duration(seconds: 4),
      ),
      items: tips.map((tip) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  tip,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue.shade900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

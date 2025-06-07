import 'package:flutter/material.dart';

class Reminder {
  final String title;
  final String type;
  final TimeOfDay time;
  bool isActive;

  Reminder({
    required this.title,
    required this.type,
    required this.time,
    this.isActive = true,
  });
}

import '../models/activity.dart';
import '../models/reminder.dart';
import 'package:flutter/material.dart';

final dummyActivities = [
  Activity(title: "Morning Run", duration: 30, date: "2025-06-01"),
  Activity(title: "Cycling", duration: 45, date: "2025-06-02"),
  Activity(title: "Yoga Session", duration: 60, date: "2025-06-03"),
  Activity(title: "Gym Workout", duration: 90, date: "2025-06-04"),
];

final weeklyActivityData = [
  {'day': 'Mon', 'minutes': 30},
  {'day': 'Tue', 'minutes': 45},
  {'day': 'Wed', 'minutes': 20},
  {'day': 'Thu', 'minutes': 50},
  {'day': 'Fri', 'minutes': 60},
];

final dummyReminders = [
  Reminder(
    title: "Drink Water",
    type: "Water",
    time: TimeOfDay(hour: 8, minute: 0),
    isActive: true,
  ),
  Reminder(
    title: "Take Medicine",
    type: "Medication",
    time: TimeOfDay(hour: 21, minute: 0),
    isActive: false,
  ),
];

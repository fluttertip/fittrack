import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/reminder_tile.dart';
import '../widgets/models/add_reminder_modal.dart'; // Adjust path if needed
import '../models/reminder.dart'; // Adjust path if needed

class RemindersScreen extends StatefulWidget {
  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  late List<Reminder> reminders;

  @override
  void initState() {
    super.initState();
    reminders = List<Reminder>.from(dummyReminders); // Start with hardcoded
  }

  void _addReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Reminder added")));
  }

  void _deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Reminder deleted")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminders')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ReminderTile(
            reminder: reminder,
            onToggle: (bool value) {
              setState(() {
                reminders[index].isActive = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(value ? "Reminder On" : "Reminder Off")),
              );
            },
            onDelete: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Delete Reminder"),
                  content: Text(
                    "Are you sure you want to delete this reminder?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _deleteReminder(index);
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (_) => AddReminderModal(
              onAdd: (reminder) {
                Navigator.pop(context);
                _addReminder(reminder);
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

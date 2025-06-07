import 'package:flutter/material.dart';
import '../models/reminder.dart';

class ReminderTile extends StatelessWidget {
  final Reminder reminder;
  final Function(bool) onToggle;
  final VoidCallback onDelete;

  const ReminderTile({
    required this.reminder,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(reminder.title),
        subtitle: Text('${reminder.type} • ${reminder.time.format(context)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(value: reminder.isActive, onChanged: onToggle),
            IconButton(icon: Icon(Icons.delete_outline), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}

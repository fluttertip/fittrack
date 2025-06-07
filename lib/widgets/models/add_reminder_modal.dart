import 'package:flutter/material.dart';
import '../../models/reminder.dart'; // Adjust the path if needed

class AddReminderModal extends StatefulWidget {
  final void Function(Reminder) onAdd; // 1. Add this line

  const AddReminderModal({
    super.key,
    required this.onAdd,
  }); // 2. Update constructor

  @override
  State<AddReminderModal> createState() => _AddReminderModalState();
}

class _AddReminderModalState extends State<AddReminderModal> {
  final TextEditingController titleController = TextEditingController();
  final List<String> reminderTypes = [
    'Medication',
    'Water',
    'Exercise',
    'Meal',
  ];
  String selectedType = 'Medication';
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add Reminder", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),

          /// Reminder Type
          DropdownButtonFormField<String>(
            value: selectedType,
            decoration: InputDecoration(
              labelText: 'Reminder Type',
              border: OutlineInputBorder(),
            ),
            items: reminderTypes.map((type) {
              return DropdownMenuItem(value: type, child: Text(type));
            }).toList(),
            onChanged: (val) => setState(() => selectedType = val!),
          ),
          const SizedBox(height: 16),

          /// Title
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          /// Time Picker
          GestureDetector(
            onTap: _pickTime,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 12),
                  Text(
                    '${selectedTime.format(context)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Save Button
          ElevatedButton.icon(
            onPressed: () {
              // 3. Create a Reminder object and call onAdd
              final reminder = Reminder(
                title: titleController.text,
                type: selectedType,
                time: selectedTime,
                isActive: true,
              );
              widget.onAdd(reminder);
            },
            icon: Icon(Icons.check),
            label: Text("Save Reminder"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/activity.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        activities = List<Activity>.from(dummyActivities);
      });
    });
  }

  void _addActivity(Activity activity) {
    setState(() {
      activities.add(activity); // ✅ Triggers rebuild
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("${activity.title} added")));
  }

  void _deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Activity deleted")));
  }

  void _showAddActivityModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => LogActivityModal(onAdd: _addActivity),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Current activities: ${activities.length}");

    return Scaffold(
      appBar: AppBar(title: Text('Activity Tracker')),
      body: Column(
        children: [
          // if (activities.isNotEmpty)
          //   // Padding(
          //   //   padding: const EdgeInsets.all(1),
          //   //   child: ActivityChart(
          //   //     activityData: activities
          //   //         .map((a) => a.duration.toDouble())
          //   //         .toList(),
          //   //   ),
          //   // )
          // else
          //   Padding(
          //     padding: const EdgeInsets.all(32.0),
          //     child: Text("No activities logged yet"),
          //   ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(Icons.directions_run),
                    title: Text(activity.title),
                    subtitle: Text(
                      '${activity.duration} mins - ${activity.date}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteActivity(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddActivityModal,
        icon: Icon(Icons.add),
        label: Text('Log Activity'),
      ),
    );
  }
}

class LogActivityModal extends StatefulWidget {
  final Function(Activity) onAdd;

  LogActivityModal({required this.onAdd});

  @override
  _LogActivityModalState createState() => _LogActivityModalState();
}

class _LogActivityModalState extends State<LogActivityModal> {
  final _durationController = TextEditingController();
  String selectedActivity = 'Running';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 24,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Log New Activity', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Duration (mins)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedActivity,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedActivity = value;
                });
              }
            },
            items: ['Running', 'Walking', 'Cycling', 'Swimming']
                .map(
                  (activity) => DropdownMenuItem<String>(
                    value: activity,
                    child: Text(activity),
                  ),
                )
                .toList(),
            decoration: InputDecoration(
              labelText: 'Select Activity',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final duration = int.tryParse(_durationController.text);
              if (duration != null && duration > 0) {
                final newActivity = Activity(
                  title: selectedActivity,
                  duration: duration,
                  date: DateTime.now().toString().substring(0, 10),
                );
                widget.onAdd(newActivity);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Enter a valid duration")),
                );
              }
            },
            child: Text("Add Activity"),
          ),
        ],
      ),
    );
  }
}

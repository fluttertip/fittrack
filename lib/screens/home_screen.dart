import 'package:fittrack/screens/activity_screen.dart';
import 'package:fittrack/screens/profile_screen.dart';
import 'package:fittrack/screens/reminders_screen.dart';
import 'package:fittrack/screens/water_screen.dart';
import 'package:fittrack/theme/app_colors.dart';
import 'package:fittrack/theme/app_text_styles.dart';
import 'package:fittrack/widgets/health_tip_carousel.dart';
import 'package:fittrack/widgets/models/health_coach_modal.dart';
import 'package:fittrack/widgets/progress_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  int _glassesDrunk = 4;
  final int _goal = 8;

  void _addWater() {
    setState(() {
      if (_glassesDrunk < _goal) _glassesDrunk++;
    });
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final _screens = [
      DashboardView(
        glassesDrunk: _glassesDrunk,
        goal: _goal,
        onAddWater: _addWater,
        onGoToWater: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WaterScreen(
                glassesDrunk: _glassesDrunk,
                goal: _goal,
                onAddWater: () {
                  setState(() {
                    if (_glassesDrunk < _goal) _glassesDrunk++;
                  });
                },
              ),
            ),
          );
        },
      ),
      ActivityScreen(),
      RemindersScreen(),
      WaterScreen(
        glassesDrunk: _glassesDrunk,
        goal: _goal,
        onAddWater: _addWater,
      ),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Activity',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Reminders'),
          BottomNavigationBarItem(icon: Icon(Icons.water), label: 'Water'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => HealthCoachModal(),
          );
        },
        label: Text("Ask Coach"),
        icon: Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  final int glassesDrunk;
  final int goal;
  final VoidCallback onAddWater;
  final VoidCallback onGoToWater;

  const DashboardView({
    Key? key,
    required this.glassesDrunk,
    required this.goal,
    required this.onAddWater,
    required this.onGoToWater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Today Summary", style: AppTextStyles.heading),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProgressCard(title: "Steps", value: 7000, goal: 10000),
              ProgressCard(title: "Water", value: glassesDrunk, goal: goal),
            ],
          ),
          SizedBox(height: 40),
          HealthTipCarousel(),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.fitness_center),
                  label: Text("Add Activity"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityScreen()),
                    );
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.water),
                  label: Text("Add Water"),
                  onPressed: onGoToWater,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          //add more features or some charts here
          Card(
            color: Colors.orange[50],
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.local_fire_department, color: Colors.orange),
              title: Text("Calories Burned"),
              subtitle: Text("520 kcal burned today"),
              trailing: Icon(Icons.trending_up, color: Colors.orange),
            ),
          ),
          Card(
            color: Colors.blue[50],
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.bedtime, color: Colors.blue),
              title: Text("Sleep"),
              subtitle: Text("7h 45m last night"),
              trailing: Icon(Icons.nightlight_round, color: Colors.blue),
            ),
          ),
          Card(
            color: Colors.green[50],
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.show_chart, color: Colors.green),
              title: Text("Weekly Activity"),
              subtitle: Text("You are on track!"),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.purple),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Tip: Consistency is key! Try to move every hour for better health.",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

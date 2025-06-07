import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../theme/theme_provider.dart';
import '../widgets/custom_tile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              "Niranjan Dahal",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: Text("Premium Member", style: TextStyle(color: Colors.grey)),
          ),
          Divider(height: 32),
          // CustomTile(
          //   icon: Icons.brightness_6,
          //   // title: "Dark Mode",
          //   // trailing: Switch(
          //   //   value: themeProvider.isDarkMode,
          //   //   onChanged: (val) => themeProvider.toggleTheme(),
          //   // ),
          // ),
          CustomTile(
            icon: Icons.notifications,
            title: "Notifications",
            trailing: Icon(Icons.chevron_right),
          ),
          CustomTile(
            icon: Icons.info_outline,
            title: "About",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutPage()),
              );
            },
          ),
          CustomTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Logged out")));
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About FitTrack")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "FitTrack is a health & fitness MVP prototype for managing daily wellness — including activity tracking, water intake, reminders, and more. Designed with Material 3 principles.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

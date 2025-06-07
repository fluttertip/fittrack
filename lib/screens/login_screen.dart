import 'package:fittrack/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Spacer(),
              Text("Welcome to FitTrack", style: AppTextStyles.heading),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: Text("Login"),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: Text("Continue as guest"),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.g_mobiledata), onPressed: () {}),
                  IconButton(icon: Icon(Icons.facebook), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

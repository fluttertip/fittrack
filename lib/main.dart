// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fittrack/screens/splash_screen.dart';
// import 'package:fittrack/screens/login_screen.dart';
// import 'package:fittrack/screens/home_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const FitTrackApp());
// }

// class FitTrackApp extends StatelessWidget {
//   const FitTrackApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light().copyWith(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         scaffoldBackgroundColor: Colors.white,
//         primaryColor: Colors.blueAccent,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 1,
//         ),
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => SplashScreen(),
//         '/login': (context) => LoginScreen(),
//         '/home': (context) => HomeScreen(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Initial screen
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/activity_screen.dart';

void main() {
  runApp(const FitTrackApp());
}

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return MaterialApp(
          title: 'FitTrack',
          builder: (context, child) {
            if (isMobile) return child!;

            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "This app is best viewed in mobile size. Please resize your browser.",
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 800,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: child!,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/home': (context) => HomeScreen(),
          },
        );
      },
    );
  }
}

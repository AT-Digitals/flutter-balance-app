import 'package:flutter/material.dart';
// import 'hrt_steps/BalancePlusPage.Dart'; // Ensure BalanceAppScreen.dart is correctly implemented
import 'pages/screens/BalanceAppScreen.dart';
import 'package:balance_app/widgets/HelpButtonDemo.Dart'; // Corrected import BalanceAppScreen
import 'package:flutter/services.dart';

void main() {
  // Change Status Bar and Bottom Navigation Bar Colors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Top status bar color
    statusBarIconBrightness:
        Brightness.light, // White icons for dark background
    systemNavigationBarColor:
        const Color(0xFFF8EBF7), // Bottom navigation bar color
    systemNavigationBarIconBrightness: Brightness.light, // White icons
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppWithStickyButton(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppWithStickyButton extends StatefulWidget {
  const AppWithStickyButton({super.key});

  @override
  _AppWithStickyButtonState createState() => _AppWithStickyButtonState();
}

class _AppWithStickyButtonState extends State<AppWithStickyButton> {
  final int _currentIndex = 0;

  final List<Widget> _pages = [
    const BalanceAppScreen(), // Main page content
    // BalancePlusPage(),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Profile Page')),
  ];

  bool isExpanded = false;

  void toggleButton() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Page Content
          _pages[_currentIndex],

          // Sticky Button
          Positioned(right: -50, bottom: 140, child: HelpButtonDemo()
              //  HelpButtonDemo(
              //   isExpanded: isExpanded,
              //   onToggle: toggleButton,
              // ),
              ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   // Change Status Bar and Bottom Navigation Bar Colors
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.blue, // Top status bar color
//     statusBarIconBrightness:
//         Brightness.light, // White icons for dark background
//     systemNavigationBarColor: Colors.black, // Bottom navigation bar color
//     systemNavigationBarIconBrightness: Brightness.light, // White icons
//   ));

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Top & Bottom Colors"),
//         backgroundColor: Colors.blue, // App Bar color
//       ),
//       body: Center(child: Text("Hello, Flutter!")),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.green, // Bottom Navigation Bar color
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//         ],
//       ),
//     );
//   }
// }


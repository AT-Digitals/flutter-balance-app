import 'package:flutter/material.dart';
import 'package:balance_app/pages/forms/LoginScreen.Dart';
import 'package:balance_app/pages/screens/BalanceAppScreen.dart';

class WoopsPage extends StatefulWidget {
  @override
  _WoopsPageState createState() => _WoopsPageState();
}

class _WoopsPageState extends State<WoopsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BalanceAppScreen())
            )
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: Padding(
       padding: const EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Woops!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0b5369),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You already have a Balance\naccount',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.5,
                      color: Color(0xFF0b5369),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                   const Text(
                    'You have an existing Balance account\nregistered to antoshoba@gmail.com.\nPlease log in to that account instead,\nusing Reset Password if necessary.',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.5,
                      color: Color(0xFF0b5369),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the LoginScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF353fbb),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Color(0xFFF8EBF7), fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

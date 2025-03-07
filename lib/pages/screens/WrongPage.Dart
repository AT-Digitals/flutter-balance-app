import 'package:flutter/material.dart';
import 'package:balance_app/pages/forms/LoginScreen.Dart';
import 'package:balance_app/pages/screens/BalanceAppScreen.dart';

class WrongPage extends StatefulWidget {
  @override
  _WrongPageState createState() => _WrongPageState();
}

class _WrongPageState extends State<WrongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
           onPressed: () => Navigator.pop(context)
        ),
        title: const Text(
          '',
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
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 250),
                   const Text(
                    'The verification code provided\nwas not valid. Please check it was\nentered correctly, or request a new\ncode.',
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
                      // Navigate to the LoginScreen
                      onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF353fbb),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Go back',
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

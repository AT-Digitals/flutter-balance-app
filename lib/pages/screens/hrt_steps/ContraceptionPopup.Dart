import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/ContraceptionScreen.Dart';

class ContraceptionPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEF4), // Set outer background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Why we're asking about contraception",
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.5,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "There are lots of different types of contraception but we're interested in those which can affect your hormones and your menopause. We ask you for this information so that we can show you relevant articles that will help you understand how your contraception can affect the menopause.",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContraceptionScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4C48B7),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text(
                          'Okay, got it',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

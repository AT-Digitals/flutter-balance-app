import 'package:flutter/material.dart';
import 'package:balance_app/pages/forms/LoginScreen.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/screens/hrt_steps/PeriodScreen.dart';

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F5), // Light background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingPage()),
            );
          },
        ),
        title: const Text(
          'Health Overview',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                
                   Text(
                      "Your health overview",
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF24495A),
                      ),
                    ),
                
                  const SizedBox(height: 20),
                  // Image
                  Center(
                    child: Image.asset(
                      'assets/images/balance_mobile.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Description
                  const Text(
                    "To get the very best out of the balance app, we would suggest inputting some medical history.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF24495A),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Certain health conditions can be caused by hormones or have an impact on your health during the perimenopause and the menopause. We ask you for this information so that we can surface relevant articles that will help you understand how your health can affect the menopause.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF24495A),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Buttons
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PeriodScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4C48B7),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Add health overview',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF4C48B7),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Center(
                            child: Text(
                              "I'll do this later",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4C48B7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
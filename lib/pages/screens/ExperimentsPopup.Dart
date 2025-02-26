import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';

class ExperimentsPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEF4), // Set outer background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Experiments',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
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
                        "What are experiments?",
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.5,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "These are tasks we've created for you to try based on things other people have found to help their wellbeing.",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "They won’t necessarily work for everyone, but they're all based on improving general health. So why not try a couple and see what works for you?",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OnboardingPage()),
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

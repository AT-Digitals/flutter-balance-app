import 'package:flutter/material.dart';
import 'package:balance_app/pages/forms/VerifyEmailPage.dart';
import 'package:balance_app/pages/screens/EmailNotReceivedPage.dart';

class CheckEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( 
         padding: const EdgeInsets.all(0),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5), 
              const Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E5D6E)
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Thanks for that!\n\nWe’ve sent thailaks@gmail.com an\nemail with the next steps. Please\ncheck your spam if you can’t see it in\nyour inbox.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Color(0xFF1E5D6E),
                   fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
                Center(
  child: ElevatedButton(
                onPressed: () {
                  // Handle 'Go to my inbox' action
                },
               style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0),
                    backgroundColor:  const Color(0xFF3640BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                child: const Text(
                  'Go to my inbox',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),),
              const SizedBox(height: 20),
   Center(
  child: TextButton(
    onPressed: () {
      // Handle 'I haven't received an email' action
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailNotReceivedPage()),
      );
    },
    child: const Text(
      "I haven't received an email",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        color:Color(0xFF3640BB)
      ),
    ),
  ),
),
 const SizedBox(height: 10),
             Center(
  child:  TextButton(
                onPressed: () {
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerifyEmailPage()),
      );
                },
                child: const Text(
                  'Enter code manually',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color:Color(0xFF3640BB)
                  ),
                ),
              ),),
               const SizedBox(height: 10),
              Center(
  child: 
              TextButton(
                onPressed: () {
                  // Handle 'Exit registration' action
                },
                child: const Text(
                  'Exit registration',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color:Color(0xFF3640BB)
                  ),
                ),
              ),),
              const SizedBox(height: 20),
              Center(
  child: 
              Image.asset(
                'assets/images/yoga.jpg', // Replace with your image path
                height: 300,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

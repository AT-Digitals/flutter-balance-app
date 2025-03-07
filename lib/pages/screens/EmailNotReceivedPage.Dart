import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/BalanceTabScreen.dart';
import 'package:balance_app/pages/forms/ResendEmailPage.dart';

class EmailNotReceivedPage extends StatefulWidget {
  @override
  _EmailNotReceivedPageState createState() => _EmailNotReceivedPageState();
}

class _EmailNotReceivedPageState extends State<EmailNotReceivedPage> {
  bool _showResentMessage = false;

  void _resendEmail() {
    // Logic to resend the email
    print("Resending email...");

    // Show the message for 2 seconds
    setState(() {
      _showResentMessage = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showResentMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BalanceTabScreen()),
            );
          },
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
       backgroundColor: const Color(0xFFFAF9FF),
      body: Scrollbar(
        thumbVisibility: true, // Makes the scrollbar always visible
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email not received',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                 color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'We\'ve sent an email to:',
                style: TextStyle(
                  fontSize: 20,
                   color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'premila1990@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please double-check for any typos. If there is a typo, you can re-enter it.',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                   color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResendEmailPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Re-enter your email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      color:  Color(0xFF353fbb),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Check your spam; you may need to wait a couple of minutes for the email to appear.',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 10),
               Center(
              child:GestureDetector(
                onTap: _resendEmail,
                child:  Text(
                  "Attempt to re-send the email",
                  style: TextStyle(
                    fontSize: 16,
                    color: _showResentMessage
    ? const Color.fromRGBO(53, 63, 187, 0.5) // RGBA equivalent with 50% opacity
    : const Color(0xFF353FBB), // Keep this as a constant
                    fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ),
              
              const SizedBox(height: 30),
              const Text(
                'If you still haven’t received an email from us, you can contact us at the address below:',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  color: Color(0xFF0b5369),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle contact action (email link)
                  },
                  child: const Text(
                    'info@balance-app.com',
                    style: TextStyle(
                      fontSize: 16,
                       color:  Color(0xFF353fbb),

                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Center(
                child:    // Stack to overlay content on top of the image
              Stack(
                alignment: Alignment.center,
                children: [
                  // Image at the background
                  Image.asset(
                    'assets/images/balance_mobile.jpg', // Replace with your saved image path
                    height: 300,
                  ),
                  // Positioned message on top of the image
                  if (_showResentMessage)
                    Positioned(
                      bottom: 230, // Adjust position from the bottom of the image
                      child: Container(
padding: const EdgeInsets.only(left: 26, right: 26, top: 12, bottom: 12),
  decoration: BoxDecoration(
    color: Color(0xFF0DF4EB),
    borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
  ),
  child: Text(
    "Code re-sent via email",
    style: TextStyle(fontSize: 16, color: Colors.black),
  ),
)

                    ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

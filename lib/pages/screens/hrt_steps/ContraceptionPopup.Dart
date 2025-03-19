import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/ContraceptionScreen.dart';
import 'package:balance_app/pages/screens/hrt_steps/CustomCard.dart'; // Import the common widgets file

class ContraceptionPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEF4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCard(
            title: "Why we're asking about contraception",
            description:
                "There are lots of different types of contraception but we're interested in those which can affect your hormones and your menopause. We ask you for this information so that we can show you relevant articles that will help you understand how your contraception can affect the menopause.",
            buttonText: "Okay, got it",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContraceptionScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


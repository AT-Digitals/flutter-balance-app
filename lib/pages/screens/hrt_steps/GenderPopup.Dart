import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/PersonalDataPage.dart';
import 'package:balance_app/pages/screens/hrt_steps/CustomCard.dart';

class GenderPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEF4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCard(
            title: "Gender",
            description:
                "At Balance we believe that everyone should have access to information about how menopause amy affect thenselves, their family, or their friends. We want to know a bit more about who is using our app so that we can make sure we are providing useful content for all our users. Please answer where you feel comfortable to do so.",
            buttonText: "Okay, got it",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalDataPage(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

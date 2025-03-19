import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/PersonalDataPage.dart';
import 'package:balance_app/pages/screens/hrt_steps/CustomCard.dart';

class Ethincity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEEF4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomCard(
            title: "Ethincity",
            description:
                "Ethnicity can have an influence on how likely you are to get certain health conditions. Telling us your ethnicity can help us to understand whether you're at a higher risk for different kinds of health conditions such as osteoporosis or heart disease.",
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

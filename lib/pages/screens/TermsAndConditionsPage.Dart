import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/BalanceTabScreen.dart';

class TermsAndConditionsPage extends StatelessWidget {
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
          'Terms And Conditions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      backgroundColor: Color(0xFFFAF9FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms and conditions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E5D73)
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'TERMS AND CONDITIONS OF\nUSE FOR OUR WEBSITE AND THE\nBALANCE APP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E5D73)
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Balance, by Newson\nHealth Limited',
              style: TextStyle(fontSize: 18, color: Color(0xFF1E5D73)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Balance is an app that has been\ncreated with a single mission in\nmind: '
              'to provide evidence based and non-biased information about the\nperimenopause '
              'and the menopause\nfor people across the world.',
              style: TextStyle(fontSize: 18, height: 1.5, color: Color(0xFF1E5D73)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Below are our terms of use for\nour Website and the Balance App\n(defined below).',
              style: TextStyle(fontSize: 18, color: Color(0xFF1E5D73)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please note that neither the content\nof the Website nor the Balance\nApp is intended '
              'in any way to be a\nsubstitute for professional medical\nadvice, diagnosis, or treatment.\n'
              'Always seek the advice of your\ndoctor or other qualified health\nprovider with any questions '
              'you may\nhave regarding a medical condition.\nNever disregard professional\nmedical advice or '
              'delay in seeking\nit because of something you have\nread within our content. If you think\nyou may '
              'have a medical emergency,\nspeak to your doctor or contact the\nemergency services immediately.',
              style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w600, color: Color(0xFF1E5D73)),
            ),
             const SizedBox(height: 20),
            const Text(
              'IMPORTANT NOTICE:',
              style: TextStyle(fontSize: 18, color: Color(0xFF1E5D73), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'USE OF THE WEBSITE: BY USING OUR\nWEBSITE, YOU CONFIRM THAT YOU\nACCEPT THESE TERMS AND THAT\nYOU AGREE TO COMPLY WITH THEM.\n'
              'IF YOU DO NOT AGREE TO THESE\nTERMS, YOU MUST NOT USE OUR\nWEBSITE.',
              style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w600, color: Color(0xFF1E5D73)),
            ),
             const SizedBox(height: 20),
              const Text(
              'USE OF THE BALANCE APP: BY\nTICKING TO ACCEPT THESE TERMS\nAND CONDITIONS, YOU WILL BY\nBOUND BY THEM. IF YOU DO NOT\nAGREE TO THESE TERMS AND\nCONDITIONS, DO NOT TICK TO\nACCEPT THEM.',
              style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w600, color: Color(0xFF1E5D73)),
            ),
          ],
        ),
      ),
    );
  }
}

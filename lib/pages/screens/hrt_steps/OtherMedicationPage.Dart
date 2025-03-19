import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/ProceduresPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OtherMedicationPage extends StatefulWidget {
  @override
  _OtherMedicationPageState createState() => _OtherMedicationPageState();
}

class _OtherMedicationPageState extends State<OtherMedicationPage> {
   TextEditingController _medicationController = TextEditingController();

  int selectedIndex = 3;

  List<String> tabTitles = [
    'Other Medication',
    'HRT Medication',
    'Contraception',
    'Other Medication',
    'Procedures',
    'Health Conditions',
    'Frequent Symptoms',
    'Height',
    'Weight',
    'Smoking',
    'Alcohol'
  ];

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSavedMedication(); // Load saved data when page is opened
  }

  // Save text input
  void _saveMedication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('otherMedication', _medicationController.text);
  }

  // Load saved text input
  void _loadSavedMedication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _medicationController.text = prefs.getString('otherMedication') ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        title: Text(
          tabTitles[selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(tabTitles.length, (index) {
                return GestureDetector(
                  onTap: () => handleButtonPress(index),
                  child: Container(
                    height: 4,
                    width: screenWidth * 0.08,
                    color: selectedIndex == index ? Colors.teal : Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  ),
                );
              }),
            ),
          ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Please write if you are on any other medication",
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _medicationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFFE5C7FC)), // 50% opacity
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // This keeps the button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProceduresPage()),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4C48B7),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Next: Procedures',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                        _saveMedication(); 
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Save and continue later",
                      style: TextStyle(fontSize: 16, color: Color(0xFF4C48B7)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balance_app/pages/screens/hrt_steps/WeightPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HeightPage extends StatefulWidget {
  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  bool isCmSelected = false; // State to track the selected unit

  bool isNextEnabled = false; // To track button state

  // Controllers for text fields
  final TextEditingController ftController = TextEditingController();
  final TextEditingController inController = TextEditingController();
  final TextEditingController cmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners to track text input
     _loadSavedHeight(); 
    ftController.addListener(_checkIfNextShouldBeEnabled);
    inController.addListener(_checkIfNextShouldBeEnabled);
    cmController.addListener(_checkIfNextShouldBeEnabled);
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    ftController.dispose();
    inController.dispose();
    cmController.dispose();
    super.dispose();
  }

  // Function to check if "Next" button should be enabled
  void _checkIfNextShouldBeEnabled() {
    setState(() {
      if (isCmSelected) {
        // If cm is selected, enable button only if cm field has value
        isNextEnabled = cmController.text.isNotEmpty;
      } else {
        // If ft/in is selected, enable button if either ft or in field has value
        isNextEnabled = ftController.text.isNotEmpty || inController.text.isNotEmpty;
      }
    });
  }

    int selectedIndex = 7;

   List<String> tabTitles = [
    'Health Conditions',
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


Future<void> _saveHeight() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCmSelected', isCmSelected);
    await prefs.setString('ftValue', ftController.text);
    await prefs.setString('inValue', inController.text);
    await prefs.setString('cmValue', cmController.text);
  }

  // Function to load saved height values
  Future<void> _loadSavedHeight() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCmSelected = prefs.getBool('isCmSelected') ?? false;
      ftController.text = prefs.getString('ftValue') ?? '';
      inController.text = prefs.getString('inValue') ?? '';
      cmController.text = prefs.getString('cmValue') ?? '';
      _checkIfNextShouldBeEnabled();
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
   body: Column(
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
                        "How tall are you?",
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Show ft & in fields when cm is NOT selected
                      if (!isCmSelected)
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: ftController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text('ft', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                         controller: inController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text('in', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),

                      // Show cm field when cm is selected
                      if (isCmSelected)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                     controller: cmController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('cm', style: TextStyle(fontSize: 16)),
                          ],
                        ),

                      const SizedBox(height: 30),

                      // Switch between cm and ft/in
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCmSelected = !isCmSelected;
                          });
                        },
                        child: Text(
                          isCmSelected ? 'Switch to feet' : 'Switch to cm',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C48B7),
                          ),
                        ),
                      ),
                       const SizedBox(height: 30),
                      Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isNextEnabled
                      ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeightPage()),
                          );
                      } : null,
                      style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Color(0xFF4C48B7).withOpacity(0.5);
                    }
                    return Color(0xFF4C48B7);
                  },
                ),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              ),
                      child: const Text(
                        'Next: Weight',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                       _saveHeight();
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
              ),
            ),
          ],
        ),
    );
  }
}

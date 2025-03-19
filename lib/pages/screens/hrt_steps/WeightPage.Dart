import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balance_app/pages/screens/hrt_steps/SmokingPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  bool isCmeterSelected = false; // State to track the selected unit

  bool isNextEnabled = false; // To track button state

  // Controllers for text fields
  final TextEditingController feetController = TextEditingController();
  final TextEditingController inchesController = TextEditingController();
  final TextEditingController cmeterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners to track text input
    _loadSavedValues();
    feetController.addListener(_checkIfNextShouldBeEnabled);
    inchesController.addListener(_checkIfNextShouldBeEnabled);
    cmeterController.addListener(_checkIfNextShouldBeEnabled);
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    feetController.dispose();
    inchesController.dispose();
    cmeterController.dispose();
    super.dispose();
  }

  // Function to check if "Next" button should be enabled
  void _checkIfNextShouldBeEnabled() {
    setState(() {
      if (isCmeterSelected) {
        // If cm is selected, enable button only if cm field has value
        isNextEnabled = cmeterController.text.isNotEmpty;
      } else {
        // If ft/in is selected, enable button if either ft or in field has value
        isNextEnabled = feetController.text.isNotEmpty || inchesController.text.isNotEmpty;
      }
    });
  }

    int selectedIndex = 8;

   List<String> tabTitles = [
    'Periods',
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

Future<void> _saveSelectedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCmeterSelected', isCmeterSelected);
    await prefs.setString('feetValue', feetController.text);
    await prefs.setString('inchesValue', inchesController.text);
    await prefs.setString('cmeterValue', cmeterController.text);
  }

  // Function to load saved values
  Future<void> _loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isCmeterSelected = prefs.getBool('isCmeterSelected') ?? false;
      feetController.text = prefs.getString('feetValue') ?? '';
      inchesController.text = prefs.getString('inchesValue') ?? '';
      cmeterController.text = prefs.getString('cmeterValue') ?? '';
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
                        "How much do you weigh?",
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Show ft & in fields when cm is NOT selected
                      if (!isCmeterSelected)
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: feetController,
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
                                  const Text('st', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                         controller: inchesController,
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
                                  const Text('lbs', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),

                      // Show cm field when cm is selected
                      if (isCmeterSelected)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                     controller: cmeterController,
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
                            const Text('kg', style: TextStyle(fontSize: 16)),
                          ],
                        ),

                      const SizedBox(height: 30),

                      // Switch between cm and ft/in
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCmeterSelected = !isCmeterSelected;
                          });
                        },
                        child: Text(
                          isCmeterSelected ? 'Switch to stones' : 'Switch to kg',
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
                            MaterialPageRoute(builder: (context) => SmokingPage()),
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
                        'Next: Smoking',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      _saveSelectedValues();
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

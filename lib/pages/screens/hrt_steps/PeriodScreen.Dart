import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:balance_app/pages/screens/hrt_steps/HRTMedicationScreen.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';

class PeriodScreen extends StatefulWidget {
  @override
  _PeriodScreenState createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  String? selectedOption = "They're regular";
  String warningMessage =
      "Your currently selected answer will disable the Period Journal feature.";
  int selectedIndex = 0;

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

  @override
  void initState() {
    super.initState();
    _loadSavedSelection();
  }

  // Load saved selection from SharedPreferences
  Future<void> _loadSavedSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedOption = prefs.getString('selectedPeriodOption') ?? "They're regular";
    });
  }

  // Save selection in SharedPreferences
  Future<void> _saveSelection(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedPeriodOption', value);
  }

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
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
            child: IndexedStack(
              index: selectedIndex,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How would you describe your periods?",
                                style: TextStyle(
                                  fontFamily: 'Playfair Display',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0b5369),
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  _buildOptionTile("They're regular"),
                                  _buildOptionTile("They're erratic or irregular"),
                                  _buildOptionTile("I don't have periods"),
                                ],
                              ),
                              if (selectedOption == "I don't have periods")
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.error_outline, color: Colors.purple),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          warningMessage,
                                          style: TextStyle(color: Colors.purple, fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 1; // Switch to "HRT Medication" tab
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4C48B7),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Next: HRT',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Save and continue later",
                              style: TextStyle(fontSize: 16, color: Color(0xFF4C48B7)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HRTMedicationScreen(selectedOption: selectedOption),
                  ),
                ),
                ...List.generate(7, (index) {
                  return Center(
                    child: Text("Content for tab ${index + 3}"),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFFDCDCF6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<String>(
        value: text,
        groupValue: selectedOption,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
            _saveSelection(value!); // Save selection
          });
        },
        title: Text(
          text,
          style: TextStyle(
            color: Color(0xFF054D63), fontSize: 18,
          ),
        ),
        tileColor: Colors.transparent,
      ),
    );
  }
}

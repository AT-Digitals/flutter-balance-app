
import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/SymptomsPage.Dart';
import 'package:balance_app/pages/screens/hrt_steps/HeightPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';

class HealthConditionsPage extends StatefulWidget {
  @override
  _HealthConditionsPageState createState() => _HealthConditionsPageState();
}

class _HealthConditionsPageState extends State<HealthConditionsPage> {
List<String> selectedOptions = [];
  String warningMessage =
      "Your currently selected answer will disable the Period Journal feature.";
  int selectedIndex = 5;

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

  Future<void> saveSelectedOptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('selected_health', selectedOptions);
}

Future<void> loadSelectedOptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    selectedOptions = prefs.getStringList('selected_health') ?? [];
  });
}

@override
void initState() {
  super.initState();
  loadSelectedOptions(); // Load saved options when opening the page
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
                              SizedBox(height: 20),
                              Column(
                                children: [
                                 _buildOptionTile("Adenomyosis"),
                                  _buildOptionTile("Breast cancer"),
                                  _buildOptionTile("Chronic kidney disease"),
                                   _buildOptionTile("Diabetes"),
                                     _buildOptionTile("Endometriosis"),
                                       _buildOptionTile("Fibroids"),
                                         _buildOptionTile("Gynaecological cancer"),
                                           _buildOptionTile("Heart disease"),
                                             _buildOptionTile("High blood pressure"),
                                               _buildOptionTile("Migraine"),
                                                   _buildOptionTile("MOsteoarthritis"),
                                                       _buildOptionTile("Osteoporosis"),
                                                           _buildOptionTile("PCOS"),
                                                           _buildOptionTile("Rheumatoid arthritis"),
                                                           _buildOptionTile("Severe mental illness"),
                                ],
                              ),
                            // if (selectedOptions.contains("I've had both ovaries removed") ||
                            //        selectedOptions.contains("I've had my womb removed"))
                            //     Padding(
                            //       padding: const EdgeInsets.symmetric(vertical: 10.0),
                            //       child: Row(
                            //         children: [
                            //           Icon(Icons.error_outline, color: Colors.purple),
                            //           SizedBox(width: 8),
                            //           Expanded(
                            //             child: Text(
                            //               warningMessage,
                            //               style: TextStyle(color: Colors.purple, fontSize: 14),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
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
                              //    setState(() {
                              //     selectedIndex = 1; // Switch to "HRT Medication" tab
                              //     });
                              // 
                              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SymptomsPage()),
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
                                'Next: Symptoms',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () async {
                        await saveSelectedOptions();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => OnboardingPage(),
                        ));
                      },
                            child: Text(
                              "Save and continue later",
                              style: TextStyle(fontSize: 16, color: Color(0xFF4C48B7)),
                            ),
                          ),
                        ],
                      ),
                    ),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.all(16.0),
                //     child: HeightPage(),
                //   ),
                // ),
                // ...List.generate(7, (index) {
                //   return Center(
                //     child: Text("Content for tab ${index + 3}"),
                //   );
                // }),
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
    child: CheckboxListTile(
      value: selectedOptions.contains(text), // Check if the option is selected
      onChanged: (bool? value) {
        setState(() {
          if (value == true) {
            selectedOptions.add(text); // Add if checked
          } else {
            selectedOptions.remove(text); // Remove if unchecked
          }
        });
      },
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xFF054D63), 
          fontSize: 18,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
      tileColor: Colors.transparent,
    ),
  );
}

}
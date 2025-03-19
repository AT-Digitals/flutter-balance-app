import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/PeriodScreen.Dart';
import 'package:balance_app/pages/screens/hrt_steps/ContraceptionScreen.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HRTMedicationScreen extends StatefulWidget {
  final String? selectedOption;

  HRTMedicationScreen({required this.selectedOption});

  @override
  _HRTMedicationScreenState createState() => _HRTMedicationScreenState();
}

class _HRTMedicationScreenState extends State<HRTMedicationScreen> {
  final Map<String, bool> _expandedSections = {
    'Bioidentical/compounded HRT': false,
    'Combination patches': false,
    'Combination tablets': false,
    'Estrogen gel': false,
    'Estrogen patches': false,
    'Estrogen spray': false,
    'Estrogen tablets': false,
    'Intrauterine System (IUS)': false,
    'Local (vaginal) estrogen': false,
    'Progesterone tablets': false,
    'Testosterone': false,
  };

  final Map<String, List<String>> _sectionContent = {
    'Bioidentical/compounded HRT': [
      'DHEA tablet', 'Estrogen cream', 'Estrogen lozenge', 'Estrogen patch',
      'Prenenolone tablet', 'Progesterone cream', 'Progesterone lozenge',
      'Progesterone patch', 'Testosterone cream', 'Utrogestan'
    ],
    'Combination patches': ['Combination patches - others', 'Evorel Conti', 'Evorel Sequi', 'FemSeven Conti', 'FemSeven Sequi'],
    'Combination tablets': ['Bijuve', 'Combination tablets - others', 'Elleste Duet Conti', 'Femoston', 'Femoston Conti', 'Indivina', 'Kliofem', 'Kliovance', 'Novofem', 'Premique'],
    'Estrogen gel': ['Estrogen gel - other', 'Oestrogel', 'Sandrena'],
    'Estrogen patches': ['Elleste Solo MX', 'Estraderm', 'Estradot', 'Estrogen patches - others', 'Evorel', 'FemSeven Mono'],
    'Estrogen spray': ['Estrogen spray - other', 'Lenzetto'],
    'Estrogen tablets': ['Elleste Solo', 'Estrogen tablets - other', 'Premarin', 'Zumenon'],
    'Intrauterine System (IUS)': ['IUS - other', 'Mirena'],
    'Local (vaginal) estrogen': ['Blissel (pessary)', 'Estring (vaginal ring)', 'Imvaggis (pessary)', 'Intraosa (pessary)', 'Local estrogen - other', 'Ovestin (cream)', 'Vagifem (pessary)'],
    'Progesterone tablets': ['Progesterone', 'Utrogestan'],
    'Testosterone': ['Androfeme cream', 'Testogel gel', 'Meditation', 'Testosterone tablets - other', 'Tostran gel'],
  };

List<String> _selectedItems = [];
  int selectedIndex = 1;

  List<String> tabTitles = [
    'Health Conditions', 'HRT Medication', 'Contraception', 'Other Medication', 'Procedures',
    'Health Conditions', 'Frequent Symptoms', 'Height', 'Weight', 'Smoking', 'Alcohol'
  ];

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _loadSelectedItems(); // Load previously saved selections
  }
    Future<void> _saveSelectedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedHRTItems', jsonEncode(_selectedItems));
  }

  // Load selected items from SharedPreferences
  Future<void> _loadSelectedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('selectedHRTItems');

    if (savedData != null) {
      setState(() {
        _selectedItems = List<String>.from(jsonDecode(savedData));
      });
    }
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
                      "Please select any HRT (if any) that you're currently on",
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0b5369),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6E6FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _selectedItems.isEmpty
                            ? const Text('Nothing selected')
                            : Wrap(
                                spacing: 18,
                                runSpacing: 8,
                                children: _selectedItems.map((item) => Chip(
                                  label: Text(item, style: TextStyle(color: Color(0xFF0b5369))),
                                  deleteIcon: const Icon(Icons.close),
                                  onDeleted: () => setState(() => _selectedItems.remove(item)),
                                  backgroundColor: Color(0xFFE6E6FF),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xFF0b5369), width: 1.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                )).toList(),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: _expandedSections.keys.map((section) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: _expandedSections[section]!
                                  ? Colors.white
                                  : Color(0xFFF8E7F0), // Light pink background color
                              child: ListTile(
                                title: Text(
                                  section,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0b5369),
                                  ),
                                ),
                                trailing: Icon(
                                  _expandedSections[section]!
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                ),
                                onTap: () {
                                  setState(() {
                                    _expandedSections[section] = !_expandedSections[section]!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (_expandedSections[section]!)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: _sectionContent[section]!
                                      .map(
                                        (item) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (_selectedItems.contains(item)) {
                                                _selectedItems.remove(item);
                                              } else {
                                                _selectedItems.add(item);
                                              }
                                            });
                                          },
                                          child: Container(
                                            width: 160,
                                            padding: const EdgeInsets.all(8),
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: _selectedItems.contains(item)
                                                  ? Color(0xFF3739C0)
                                                  : Color(0xFFDCDCF6),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: _selectedItems.contains(item)
                                                    ? Colors.white
                                                    : const Color(0xFF0b5369),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
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
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContraceptionScreen(),
                            ),
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
                                'Next: Contraception',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () async {
                        await _saveSelectedItems();
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

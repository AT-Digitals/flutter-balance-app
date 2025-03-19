import 'package:balance_app/pages/screens/reviews/SummariseTreatment.Dart';
import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/hrt_steps/HeightPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SymptomsPage extends StatefulWidget {


  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {

  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSymptoms = [];

   int selectedIndex = 6;

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

  final Map<String, bool> _expandedSections = {
     'Most commom symptoms': true,
     
  };

  final Map<String, List<String>> _sectionContent = {
     'Most commom symptoms':   ['Anxiety', 'Brain fog', 'Headaches', 'Hot flushes', 'Joint pain', 'Low libido', 'Low mood or depression', 'Memory problems'],
  };
 final Map<String, List<String>> _sectionSymptoms = {
 'Symptoms' : ['Abdominal pain', 'Acne', 'Allergies', 'Altered sense of smell', 'Anxiety', 'Bloating', 'Brain fog', 'breast pain or tenderness', 'Brittle nails', ' Burning mouth', 'Cold sweats', 'Constipation', 'Cramps', 'Crying spells', 'Diarrhoea', 'Difficulty breathing', 'Difficulty concentrating', 'Difficulty sleeping', 'Dry eyes', 'Dry hair', 'Dry skin', 'Excitable', 'Facial hair', 'Feeling nervous', 'Feeling tense', 'Frequent urination', 'Hair loss or thinning',  'Heartbutn', 'Itching', 'Joint pain', 'Low libido', 'Memory problems', 'Muscle pain', 'Panic attacks', 'weight gain', 'wind', 'wrinkles'],
 };
     List<String> _selectedItems = [];

        final List<String> _selectedPreviousItems = [];

@override
  void initState() {
    super.initState();
    _filteredSymptoms = _sectionSymptoms['Symptoms']!;
         _loadSelectedItems(); 
  }

  void _filterSymptoms(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSymptoms = _sectionSymptoms['Symptoms']!;
      } else {
        _filteredSymptoms = _sectionSymptoms['Symptoms']!
            .where((symptom) => symptom.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

   Future<void> _saveSelectedItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selected_symptoms', _selectedItems);
  }

  // Load saved selected items from SharedPreferences
  Future<void> _loadSelectedItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedItems = prefs.getStringList('selected_symptoms') ?? [];
    });
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please select any symptoms that you frequently experience',
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
                    : SingleChildScrollView(
                        child: Wrap(
                          spacing: 18,
                          runSpacing: 8,
                          children: _selectedItems
                              .map(
                                (item) => Chip(
                                  label: Text(item, style: TextStyle(color: Color(0xFF0b5369))),
                                  deleteIcon: const Icon(Icons.close),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedItems.remove(item);
                                    });
                                  },
                                  backgroundColor: Color(0xFFE6E6FF),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xFF0b5369), width: 1.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "All Symptoms",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: _filterSymptoms,
              decoration: InputDecoration(
                hintText: 'Search symptoms',
                hintStyle: TextStyle(fontSize: 20, color: Color(0xFFE5C7FC)),
                prefixIcon: Icon(Icons.search, color: Color(0xFFE5C7FC)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Color(0xFF9A67EA), width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _filteredSymptoms.map((item) {
                bool isSelected = _selectedItems.contains(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
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
                      color: isSelected ? Color(0xFF3739C0) : Color(0xFFDCDCF6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Color(0xFF0b5369),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
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
                                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HeightPage()),
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
                                'Next: Height',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                               _saveSelectedItems();
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
        ),

  );
}
}

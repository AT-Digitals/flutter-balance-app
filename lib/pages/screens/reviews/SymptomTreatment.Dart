import 'package:balance_app/pages/screens/reviews/SummariseTreatment.Dart';
import 'package:balance_app/pages/screens/reviews/TreatmentReview.Dart';
import 'package:flutter/material.dart';

class SymptomTreatment extends StatefulWidget {

   final List<String> selectedPreviousItems; // Receive selected items

  SymptomTreatment({required this.selectedPreviousItems});

  @override
  _SymptomTreatmentState createState() => _SymptomTreatmentState();
}

class _SymptomTreatmentState extends State<SymptomTreatment> {

  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSymptoms = [];

  final Map<String, bool> _expandedSections = {
     'Most commom symptoms': true,
     
  };

  final Map<String, List<String>> _sectionContent = {
     'Most commom symptoms':   ['Anxiety', 'Brain fog', 'Headaches', 'Hot flushes', 'Joint pain', 'Low libido', 'Low mood or depression', 'Memory problems'],
  };
 final Map<String, List<String>> _sectionSymptoms = {
 'Symptoms' : ['Abdominal pain', 'Acne', 'Allergies', 'Altered sense of smell', 'Anxiety', 'Bloating', 'Brain fog', 'breast pain or tenderness', 'Brittle nails', ' Burning mouth', 'Cold sweats', 'Constipation', 'Cramps', 'Crying spells', 'Diarrhoea', 'Difficulty breathing', 'Difficulty concentrating', 'Difficulty sleeping', 'Dry eyes', 'Dry hair', 'Dry skin', 'Excitable', 'Facial hair', 'Feeling nervous', 'Feeling tense', 'Frequent urination', 'Hair loss or thinning',  'Heartbutn', 'Itching', 'Joint pain', 'Low libido', 'Memory problems', 'Muscle pain', 'Panic attacks', 'weight gain', 'wind', 'wrinkles'],
 };
    final List<String> _selectedItems = [];

        final List<String> _selectedPreviousItems = [];

@override
  void initState() {
    super.initState();
    _filteredSymptoms = _sectionSymptoms['Symptoms']!;
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
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        // onPressed: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => TreatmentReview()),
        //   );
        // },
         onPressed: () {
            Navigator.pop(context, _selectedPreviousItems); // Return selected option when going back
          },
      ),
      title: Text('Review a Treatment', style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xFF0b5369),
      centerTitle: true,
      toolbarHeight: 100.0,
    ),
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Which symptoms do you take treatment for?',
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
                ListView(
                  shrinkWrap: true, // Important for scrolling inside a column
                  physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                  children: _expandedSections.keys.map((section) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: _expandedSections[section]! ? Colors.white : Color(0xFFF8E7F0),
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
                                            color: _selectedItems.contains(item) ? Colors.white : Color(0xFF0b5369),
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
                                           prefixIcon: Icon(Icons.search, color: Color(0xFFE5C7FC)), // Change Icon color here
                                                          filled: true, // Ensures background color is applied
                                                              fillColor: Colors.white, // Background color of the TextField
                                                      border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(50), // Rounded border
                                                                          borderSide: BorderSide(color: Color(0xFFE5C7FC)), // Light gray border
                                                                            ),
                                                                      enabledBorder: OutlineInputBorder(
                                                         borderRadius: BorderRadius.circular(50), // Ensure consistency
                                                                            borderSide: BorderSide(color: Color(0xFFE5C7FC)), // Light gray when not focused
                                                                                           ),
                                                                              focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(50), // Keep it rounded when focused
                                                                borderSide: BorderSide(color: Color(0xFF9A67EA), width: 2.0), // Slightly darker border when focused
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
                          //textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 100), // Extra spacing so button is not hidden
                
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: _selectedItems.isNotEmpty
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SummariseTreatment(selectedPreviousItems: _selectedItems)),
                    );
                  }
                : null,
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
            child: Text(
              'Next',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
       
      ],

      
    ),
  );
}
}

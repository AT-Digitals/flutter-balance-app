import 'package:balance_app/pages/forms/PostCreateForm.Dart';
import 'package:flutter/material.dart';


class AddTags extends StatefulWidget {
  @override
  _AddTagsState createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  final Map<String, bool> _expandedSections = {
  'Healthcare professional visits': false,
    'Physical symptoms': false,
    'Mental health symptoms': false,
    'Treatment': false,
    'Food & drink': false,
    'Menopause phase': false,
    'Health': false,
    'Lifestyle': false
  };

  final Map<String, List<String>> _sectionContent = {
    'Healthcare professional visits': [
    'Blood tests', 'Healthcare professional visits'
    ],
    'Physical symptoms': [
     'Abdominal pain', 'Acne', 'Headache', 'Fever', 'Cough'
    ],
    'Mental health symptoms': [
      'Anxiety', 'Brain fog', 'Crying spells', 'Excitable', 'Feeling nervous', 'Irritability', 'Low mood or depression', 'Low motivation', 'Mood swings', 'Panic attacks'
    ],
    'Treatment': [
     'Acupuncture', 'Alternative treatment', 'Antidepressants', 'Aromatherapy', 'CBT', 'Combination HRT'
    ],
    'Food & drink': [
    'Alcohol', 'Anti-inflammatory', 'Blood glucose balance', 'Breakfast', 'Dairy', 'Dinner'
    ],
    'Menopause phase': [
      'Perimenopause', 'Post-menopause', 'Pre-menopause', 'Teenage menopause',
    ],
    'Health': [
      'ADHD', 'Asthma', 'Blood pressure', 'Bone health', 'Brain health', 'Breast health', 'Cancer', 'Clots', 'Covid', 'Dementia'
    ],
    'Lifestyle': [
      'App Support', 'Exercise', 'Meditation', 'News', 'Open water swimming', 'Pilates', 'Pleasure', 'Poems'
    ],
  };

  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Tags',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "In my story I spoke about",
              style: TextStyle(
                  fontFamily: 'LibreBaskerville', 
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0b5369),
              ),
            ),
            const SizedBox(height: 16),

Center(
  child: Container(
    height: 150,
    //  padding: const EdgeInsets.all(8),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(0xFFE6E6FF), // Light gray background
      borderRadius: BorderRadius.circular(8),
    ),
    child: _selectedItems.isEmpty
        ? const Text('Nothing selected')
        : SingleChildScrollView(
            child: Wrap(
              spacing: 18, // Horizontal spacing between chips
              runSpacing: 8, // Vertical spacing between chips
              children: _selectedItems
                  .map(
                    (item) => Chip(
  label: Text(item,  style: TextStyle(
                color: const Color(0xFF0b5369),
              ),),
  deleteIcon: const Icon(Icons.close),
  onDeleted: () {
    setState(() {
      _selectedItems.remove(item);
    });
  },
  backgroundColor: Color(0xFFE6E6FF), // Background color of the chip
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: const Color(0xFF0b5369), // Border color
      width: 1.5,        // Border width
    ),
    borderRadius: BorderRadius.circular(30), // Rounded corners
  ),
),

                  )
                  .toList(),
            ),
          ),
  ),
),
 const SizedBox(height: 24),
 const Text(
              "Adding tags makes it easier for others to find your story",
              style: TextStyle(
                
                fontSize: 14,
                color: const Color(0xFF0b5369),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: _expandedSections.keys.map((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
  color: const Color(0xFFF8E7F0), // Light pink background color
                     child: ListTile(
                        title: Text(
                          section,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0b5369),
                            backgroundColor: Color(0xFFF8E7F0),
                          ),
                        ),
                        trailing: Icon(
                          _expandedSections[section]!
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onTap: () {
                          setState(() {
                            _expandedSections[section] =
                                !_expandedSections[section]!;
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
                                      // (MediaQuery.of(context).size.width /
                                      //         2) -
                                      //     32,
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
      ? Colors.white // If the item is selected, set the color to white
      : const Color(0xFF0b5369), // If not selected, set the color to #0b5369
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
            ),
                        SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              //   Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => PostCreateForm()),
                Navigator.pop(context, _selectedItems);
            // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C48B7),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Done',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

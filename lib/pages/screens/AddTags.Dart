import 'package:flutter/material.dart';

class AddTags extends StatefulWidget {
  final List<String> selectedTags;

  AddTags({Key? key, required this.selectedTags}) : super(key: key);

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
    'Healthcare professional visits': ['Blood tests', 'Healthcare professional visits'],
    'Physical symptoms': ['Abdominal pain', 'Acne', 'Headache', 'Fever', 'Cough'],
    'Mental health symptoms': [
      'Anxiety', 'Brain fog', 'Crying spells', 'Excitable', 'Feeling nervous',
      'Irritability', 'Low mood or depression', 'Low motivation', 'Mood swings', 'Panic attacks'
    ],
    'Treatment': ['Acupuncture', 'Alternative treatment', 'Antidepressants', 'Aromatherapy', 'CBT', 'Combination HRT'],
    'Food & drink': ['Alcohol', 'Anti-inflammatory', 'Blood glucose balance', 'Breakfast', 'Dairy', 'Dinner'],
    'Menopause phase': ['Perimenopause', 'Post-menopause', 'Pre-menopause', 'Teenage menopause'],
    'Health': ['ADHD', 'Asthma', 'Blood pressure', 'Bone health', 'Brain health', 'Breast health', 'Cancer', 'Clots', 'Covid', 'Dementia'],
    'Lifestyle': ['App Support', 'Exercise', 'Meditation', 'News', 'Open water swimming', 'Pilates', 'Pleasure', 'Poems'],
  };

  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedTags); // Retain selected tags
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selectedItems.contains(tag)) {
        _selectedItems.remove(tag);
      } else {
        _selectedItems.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, _selectedItems);
          },
        ),
        title: Text('Add Tags', style: TextStyle(color: Colors.white)),
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
              style: TextStyle( fontFamily: 'Playfair Display', 
                fontSize: 28,
                fontWeight: FontWeight.w700, color: Color(0xFF0b5369)),
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
            const SizedBox(height: 24),
            const Text(
              "Adding tags makes it easier for others to find your story",
              style: TextStyle(fontSize: 14, color: Color(0xFF0b5369)),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: _expandedSections.keys.map((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container( 
                        color: _expandedSections[section]! ? Colors.white :  Color(0xFFF8E7F0),
                        child: ListTile(
                          title: Text(
                            section,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0b5369)),
                          ),
                          trailing: Icon(_expandedSections[section]! ? Icons.expand_less : Icons.expand_more),
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
                                    onTap: () => _toggleTag(item),
                                    child: Container(
                                      width: 160,
                                      padding: const EdgeInsets.all(8),
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: _selectedItems.contains(item) ? Color(0xFF3739C0) : Color(0xFFDCDCF6),
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedItems); // Pass back selected tags
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C48B7),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Done', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

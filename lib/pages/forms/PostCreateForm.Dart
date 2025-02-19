import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/BalanceAppScreen.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/forms/ResetPasswordPage.Dart';
import 'package:balance_app/pages/screens/AddTags.Dart';
import 'package:balance_app/pages/screens/ExperimentsPopup.Dart';
import 'package:balance_app/pages/screens/FeedBackPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';

class PostCreateForm extends StatefulWidget {
  @override
  _PostCreateFormState createState() => _PostCreateFormState();
}

class _PostCreateFormState extends State<PostCreateForm> {
  // Track if the dropdown is open or closed
  bool _isDropdownOpen = false;
  bool _isSwitched = true;
  final ScrollController _scrollController = ScrollController();
  

  final TextEditingController _storyTitleController = TextEditingController();
  final TextEditingController _storyContentController = TextEditingController();

  // Error messages
  String? _titleError;
  String? _contentError;
  String? _tagsError;

  // Simulated selected tags (Replace with actual tag selection logic)
  List<String> _selectedTags = [];

  void _validateAndPost() {
    setState(() {
      _titleError = _storyTitleController.text.isEmpty ? "Please enter a story title" : null;
      _contentError = _storyContentController.text.isEmpty ? "Please enter your story" : null;
      _tagsError = _selectedTags.isEmpty ? "Please select at least one tag" : null;
    });

    if (_titleError == null && _contentError == null && _tagsError == null) {
      // Proceed with posting the story
      print("Story posted successfully!");
    }
  }

  void _scrollToDropdown() {
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, // Scroll to the bottom
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingPage()),
            );
          },
        ),
        title: Text(
          'Create Story',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          controller: _scrollController, 
          children: [
            SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Story title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0b5369),
                  ),
                ),
                Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Briefly summarise your story",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0b5369),
                fontStyle: FontStyle.italic,
                
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _storyTitleController,
              decoration: InputDecoration(
                hintText: 'Tap to start typing',
                 hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300), // Light gray border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300), // Light gray when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300,), // Slightly darker gray when focused
    ),
     errorText: _titleError,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Your story',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0b5369),
                  ),
                ),
                Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDropdownOpen = true;
                    });
                    _scrollToDropdown();
                  },
                 child: Container(
      padding: EdgeInsets.all(4), // Padding inside the box
      decoration: BoxDecoration(
        color: Color(0xFF2409AB), // Background color
        shape: BoxShape.circle, // Circular shape
      ),
      child: Icon(
        Icons.question_mark,
        color: Colors.white, // Icon color
        size: 16, // Icon size
      ),
    ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Scroll down for tips on what to write about',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF0b5369),
        fontStyle: FontStyle.italic,
      ),
    ),
    SizedBox(width: 5), 
    Icon(
      Icons.help_outline, 
      color: Colors.white, 
      size: 20,  
    ),
  ],
),
            SizedBox(height: 8),
            TextField(
              controller: _storyContentController,
              decoration: InputDecoration(
                hintText: 'Tap to start typing',
                   hintStyle: TextStyle(color: Colors.grey.shade400),
                 border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300), // Light gray border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300), // Light gray when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300), // Slightly darker gray when focused
    ),
     errorText: _contentError,
              ),
              maxLines: 10,
            ),
            SizedBox(height: 20),
// 
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ElevatedButton(
      onPressed: () async {
        final selectedTags = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTags(selectedTags: _selectedTags)),
        );

        if (selectedTags != null && selectedTags is List<String>) {
          setState(() {
            _selectedTags = selectedTags; // Store selected tags
            _tagsError = null; // Clear the error when tags are selected
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFE6E6FF),
        minimumSize: Size(double.infinity, 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: _selectedTags.isEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tap to select tags',
                  style: TextStyle(fontSize: 18, color: Color(0xFFB793E6)),
                ),
                Text(
                  ' *',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            )
          : Container(
              constraints: BoxConstraints(maxHeight: 150), // Set a max height for expansion
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10, // Horizontal spacing
                  runSpacing: 8, // Vertical spacing
                  children: _selectedTags
                      .map(
                        (tag) => Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(color: Color(0xFF0b5369)),
                          ),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () {
                            setState(() {
                              _selectedTags.remove(tag);
                              if (_selectedTags.isEmpty) {
                                _tagsError = "Please select at least one tag";
                              }
                            });
                          },
                          backgroundColor: Color(0xFFE6E6FF),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFF0b5369), width: 1.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
    ),
    if (_tagsError != null)
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          _tagsError!,
          style: TextStyle(color: Colors.red, fontSize: 14),
        ),
      ),
  ],
),


            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color(0xFFE6E6FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Expanded( // Allows text to wrap within available space
        child: Wrap(
          children: [
            Text(
              'Link to your community profile',
              style: TextStyle(fontSize: 20, color: Color(0xFF0b5369)),
            ),
          ],
        ),
      ),
                  Transform.scale(
        scale: 0.7, // Reduce the switch size (0.8 = 80% of the default size)
        child: Switch(
  value: _isSwitched,
  onChanged: (bool value) {
    setState(() {
      _isSwitched = value;
    });
  },
  activeColor: Colors.white,          
  activeTrackColor: Color(0xFF99FFEB),  
  inactiveThumbColor: Colors.grey,      
  inactiveTrackColor: Color(0xFFD3D3D3), 
),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          Text.rich(
  TextSpan(
    style: TextStyle(fontSize: 14, color: Color(0xFF0b5369)), // Default text style
    children: [
      TextSpan(text: 'Turn this toggle '),
      TextSpan(
        text: 'off', // Bold "off"
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' to post your story anonymously. Leave this toggle '),
      TextSpan(
        text: 'on', // Bold "on"
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' to show your username on your story and display it on your community profile.'),
    ],
  ),
),

            SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                                 Expanded( // Allows text to wrap within available space
        child: Wrap(
          children: [
            Text(
              'Not sure what to write about?',
              style: TextStyle(fontSize: 24, color: Color(0xFF0b5369)),
            ),
          ],
        ),
      ),
                IconButton(
                  icon: Icon(
                    _isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down, // Toggle between up and down
                    color: Color(0xFF0b5369),
                  ),
                  onPressed: () {
                    setState(() {
                      _isDropdownOpen = !_isDropdownOpen; // Toggle state
                    });
                  },
                ),
              ],
            ),
           
            if (_isDropdownOpen)
             Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      'Healthcare Professionals\nDescribe your experiences with healthcare professionals so far.',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF0b5369),
      ),
    ),
  ),
                if (_isDropdownOpen)
                 Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      'HRT (Hormone Replacement Therapy)\nExplain your experiences with HRT, if you have had any.',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF0b5369),
      ),
    ),
  ),
                if (_isDropdownOpen)
                 Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      'Lifestyle changes\nHave you made any or attempted to make any lifestyle changes? Explain your experience.',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF0b5369),
      ),
    ),
  ), 
   if (_isDropdownOpen)
                 Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      'Work life\nDescribe your experiences in the workplace during your perimenopause/menopause journey.',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF0b5369),
      ),
    ),
  ),
   if (_isDropdownOpen)
                 Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      'Words of wisdom\nShare any advice, or learnings from your experience with the community',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF0b5369),
      ),
    ),
  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateAndPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C48B7),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Post my story',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

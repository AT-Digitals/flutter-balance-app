import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/screens/hrt_steps/AlcohalPage.Dart';

class SmokingPage extends StatefulWidget {
  //final String? initialSelection; // Accept previously selected value

  // ReviewTreatment({this.initialSelection});

  @override
  _SmokingPageState createState() => _SmokingPageState();
}

class _SmokingPageState extends State<SmokingPage> {
  String? _selectedOption;

  @override
  // void initState() {
  //   super.initState();
  //   _selectedOption = widget.initialSelection; // Restore previous selection
  // }

  void _onOptionSelected(String value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text(
          "Smoking",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'How often do you smoke?',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0b5369),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E6FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RadioListTile<String>(
                      title: Text(
                        'Never',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'Never',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _onOptionSelected(value!);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E6FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RadioListTile<String>(
                      title: Text(
                        'Rarely',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'Rarely',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _onOptionSelected(value!);
                      },
                    ),
                  ),
                   SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E6FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RadioListTile<String>(
                      title: Text(
                        'Sometimes',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'Sometimes',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _onOptionSelected(value!);
                      },
                    ),
                  ),
                   SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E6FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RadioListTile<String>(
                      title: Text(
                        'Often',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'Often',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _onOptionSelected(value!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedOption != null
                  ? () async {
                      // Navigate and pass selected value
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlcohalPage(),
                        ),
                      );

                      // Restore selection when coming back
                      if (result != null) {
                        setState(() {
                          _selectedOption = result;
                        });
                      }
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
                'Next: Alcohol',
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
    );
  }
}

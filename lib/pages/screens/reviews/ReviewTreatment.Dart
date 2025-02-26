import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/screens/reviews/CurrentTreatment.Dart';

class ReviewTreatment extends StatefulWidget {
  final String? initialSelection; // Accept previously selected value

  ReviewTreatment({this.initialSelection});

  @override
  _ReviewTreatmentState createState() => _ReviewTreatmentState();
}

class _ReviewTreatmentState extends State<ReviewTreatment> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelection; // Restore previous selection
  }

  void _onOptionSelected(String value) {
    setState(() {
      _selectedOption = value;
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
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage(),
                        ),
                      );
          },
        ),
        title: Text(
          'Review a Treatment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'What type of treatment do you want to review?',
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
                        'HRT',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'HRT',
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
                        'Alternatives to HRT',
                        style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
                      ),
                      value: 'alternatives to hrt',
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
                          builder: (context) => CurrentTreatment(previousValue: _selectedOption),
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

import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/reviews/ReviewTreatment.Dart';
import 'package:balance_app/pages/screens/reviews/TreatmentReview.Dart';

class CurrentTreatment extends StatefulWidget {
   final String? previousValue; // Receive selected option

  CurrentTreatment({this.previousValue});

  @override
  _CurrentTreatmentState createState() => _CurrentTreatmentState();
}

class _CurrentTreatmentState extends State<CurrentTreatment> {
  String? _selectedOption;

 String? _previousValue;
  @override
  void initState() {
    super.initState();
    _previousValue = widget.previousValue; // Restore previous selection
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
            Navigator.pop(context, _previousValue); // Return selected option when going back
          },
        ),
        title: Text(
          'Current Treatment',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'How long have you been taking your current treatment?',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0b5369),
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildOption('Less than 3 months'),
                  _buildOption('3-12 months'),
                  _buildOption('1-2 years'),
                  _buildOption('2-5 years'),
                  _buildOption('Over 5 years'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedOption != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TreatmentReview(previousValue: _selectedOption)),
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

  Widget _buildOption(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6E6FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RadioListTile<String>(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
          ),
          value: title,
          groupValue: _selectedOption,
          onChanged: (value) {
            _onOptionSelected(value!);
          },
        ),
      ),
    );
  }
}

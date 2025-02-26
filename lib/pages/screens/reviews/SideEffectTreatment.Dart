import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/reviews/ExperienceTreatment.Dart';
import 'SummariseTreatment.Dart';

class SideEffectTreatment extends StatefulWidget {

final String? previousValue; // Receive selected option

  SideEffectTreatment({this.previousValue});

  @override
  _SideEffectTreatmentState createState() => _SideEffectTreatmentState();
}

class _SideEffectTreatmentState extends State<SideEffectTreatment> {
  String? _selectedOption = 'no';
  TextEditingController _sideEffectController = TextEditingController();

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
          'Review a Treatment',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Have you experienced any side effects?',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0b5369),
                    ),
                  ),
                  SizedBox(height: 30),
                  buildRadioButton('Yes', 'yes'),
                  SizedBox(height: 10),
                  buildRadioButton('No', 'no'),

                  // Show TextField when 'Yes' is selected
                  if (_selectedOption == 'yes') ...[
                    SizedBox(height: 20),
                    TextField(
                      controller: _sideEffectController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Enter your side effects',
                       hintStyle: TextStyle(fontSize: 20, color: Color(0xFFE5C7FC)),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE5C7FC)), // Light gray border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE5C7FC)), // Light gray when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE5C7FC)), // Slightly darker gray when focused
    ),
  ),
                
                    ),
                  ],
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedOption != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExperienceTreatment(previousValue: _selectedOption)),
                      );
                    }
                  : null, // Disable button if no option is selected
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

  Widget buildRadioButton(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE6E6FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile<String>(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, color: Color(0xFF0b5369)),
        ),
        value: value,
        groupValue: _selectedOption,
        onChanged: (newValue) {
          _onOptionSelected(newValue!);
        },
      ),
    );
  }
}

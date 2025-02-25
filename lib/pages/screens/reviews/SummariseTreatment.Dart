import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/reviews/SideEffectTreatment.Dart';
import 'package:balance_app/pages/screens/reviews/SymptomTreatment.Dart';

class SummariseTreatment extends StatefulWidget {

 final List<String> selectedPreviousItems; // Receive selected items

  SummariseTreatment({required this.selectedPreviousItems});

  @override
  _SummariseTreatmentState createState() => _SummariseTreatmentState();
}

class _SummariseTreatmentState extends State<SummariseTreatment> {
  String? _selectedOption;

 final List<String> _selectedPreviousItems = [];

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
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => SymptomTreatment()),
          //   );
          // },
           onPressed: () {
            Navigator.pop(context, _selectedPreviousItems); // Return selected option when going back
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
                    'Summarise your experience with this treatment.',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0b5369),
                    ),
                  ),
                  SizedBox(height: 30),
                  buildRadioButton('No improvement'),
                  SizedBox(height: 10),
                  buildRadioButton('Slight improvement'),
                  SizedBox(height: 10),
                  buildRadioButton('Significant improvement'),
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
                        MaterialPageRoute(builder: (context) => SideEffectTreatment(previousValue: _selectedOption)),
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

  Widget buildRadioButton(String title) {
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
        value: title,
        groupValue: _selectedOption,
        onChanged: (value) {
          _onOptionSelected(value!);
        },
      ),
    );
  }
}

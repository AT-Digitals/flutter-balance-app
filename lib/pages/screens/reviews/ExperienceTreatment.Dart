import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/reviews/RateTreatment.Dart';
import 'package:balance_app/pages/screens/reviews/SideEffectTreatment.Dart';

class ExperienceTreatment extends StatefulWidget {

  final String? previousValue; // Receive selected option

  ExperienceTreatment({this.previousValue});

  @override
  _ExperienceTreatmentState createState() => _ExperienceTreatmentState();
}

class _ExperienceTreatmentState extends State<ExperienceTreatment> {
  final TextEditingController _feedbackController = TextEditingController();
  bool _isButtonEnabled = false;
  int _maxCharacters = 150;
  int _remainingCharacters = 150;

 String? _previousValue;

  
  @override
  void initState() {
    super.initState();
   _feedbackController.addListener(_checkInput);
  }

  void newState() {
    super.initState();
    _previousValue = widget.previousValue; // Restore previous selection
  }


  void _checkInput() {
    setState(() {
      _isButtonEnabled = _feedbackController.text.trim().isNotEmpty;
      _remainingCharacters = _maxCharacters - _feedbackController.text.length;
    });
  }

  @override
  void dispose() {
    _feedbackController.removeListener(_checkInput);
    _feedbackController.dispose();
    super.dispose();
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
          //     MaterialPageRoute(builder: (context) => SideEffectTreatment()),
          //   );
          //    },
           onPressed: () {
            Navigator.pop(context, _previousValue); // Return selected option when going back
      
          },
        ),
        title: Text(
          'Review a Treatment',
          style: TextStyle(
            color: Colors.white, // White color for the title text
          ),
        ),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
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
                  TextField(
                    controller: _feedbackController,
                    maxLength: _maxCharacters,
                    decoration: InputDecoration(
                      hintText: "Tell us about it",
                      hintStyle: TextStyle(fontSize: 20, color: Color(0xFFE5C7FC)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                       counterText: "",
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$_remainingCharacters characters left',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0), // Bottom padding
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                       
                    onPressed: _isButtonEnabled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RateTreatment(previousValue: _feedbackController.text)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/medications/HrtMedicationScreen.Dart';
import 'package:balance_app/pages/medications/ContraceptionPage.Dart';

class MedicationPage extends StatefulWidget {
  final String? previousValue;

  MedicationPage({this.previousValue});

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  String? _previousValue;
  bool _isOtherMedicationVisible = false;
  bool _isChecked = true; // Checkbox always checked
  final TextEditingController _medicationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _previousValue = widget.previousValue;
  }

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
        title: Text('Medication', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
  body: Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "HRT",
                  style: TextStyle(
                    
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0b5369),
                  ),
                ),
                const SizedBox(height: 16),
                
    // padding: EdgeInsets.all(16.0),
         TextButton(
          onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HrtMedicationScreen(),
                        ),
                      );
          },
          child: Text(
            "Set HRT",
            //textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16,
          fontWeight: FontWeight.bold,
           color: Color(0xFF4C48B7)),
          ),
        ),
 
      const SizedBox(height: 16),
      const Text(
                  "Contraception",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0b5369),
                  ),
                ),
                const SizedBox(height: 16),
          //  Padding(
    // padding: EdgeInsets.all(16.0),
         TextButton(
          onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContraceptionPage(),
                        ),
                      );
          },
          child: Text(
            "Set contraception",
            //textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4C48B7)),
          ),
        ),

      const SizedBox(height: 16),
                const Text(
                  "Other medication",
                  style: TextStyle(
                  
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0b5369),
                  ),
                ),
                const SizedBox(height: 16),
             //   Padding(
     //padding: EdgeInsets.all(16.0),
         TextButton(
          
             onPressed: () {
                        setState(() {
                          _isOtherMedicationVisible = !_isOtherMedicationVisible; // Toggle visibility
                        });
                      },
        
          child: Text(
            "Set other medication",
            //textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4C48B7)),
          ),
        ),
 
      const SizedBox(height: 16),
                       Row(
                      children: [
                        Expanded(
                          child: TextField(
                           // controller: _medicationController,
                            decoration: InputDecoration(
                              hintText: "Add medication",
                              hintStyle: TextStyle(color: Color(0xFFE5C7FC)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFFE5C7FC)),
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ),
                        // Always checked checkbox
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue ?? true; // Keep it always true
                            });
                          },
                        ),
                      ],
                    ),
                 
                
              ],
            ),
          ),
        ),
      ),
       ],
      ),
            
    );
  }
}

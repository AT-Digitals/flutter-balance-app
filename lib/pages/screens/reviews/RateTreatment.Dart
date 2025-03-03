import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';
import 'package:balance_app/pages/screens/reviews/ExperienceTreatment.Dart';

class RateTreatment extends StatefulWidget {

  final String? previousValue; // Receive selected option

  RateTreatment({this.previousValue});
  @override
  _RateTreatmentState createState() => _RateTreatmentState();
}

class _RateTreatmentState extends State<RateTreatment> {
  int _selectedStars = 0; // Variable to track the selected star rating

   String? _previousValue;

  
  @override

  void newState() {
    super.initState();
    _previousValue = widget.previousValue; // Restore previous selection
  }

  void _onStarSelected(int rating) {
    setState(() {
      _selectedStars = rating;
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
          //     MaterialPageRoute(builder: (context) => ExperienceTreatment()),
          //   );
          // },
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
            SizedBox(height: 15),
            Text(
              'Overall, how would you rate your treatment?',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0b5369),
              ),
            ),
            SizedBox(height: 20),
            _buildStarRating(), // Function to build the star rating
            Expanded(child: Container()), // Takes up remaining space
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0), // Bottom padding
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _selectedStars >= 1
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OnboardingPage()),
                            );
                          }
                        : null,
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: _selectedStars >= 1
                    //       ? Color(0xFF4C48B7)
                    //       : Color(0xFF4C48B7).withOpacity(0.5),
                    // ),
                     style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> _selectedStars) {
                    if (_selectedStars.contains(MaterialState.disabled)) {
                      return Color(0xFF4C48B7).withOpacity(0.5);
                    }
                    return Color(0xFF4C48B7);
                  },
                ),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              ),
                    child: Text(
                      'Publish Review',
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

  // Function to build star rating
  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _selectedStars ? Icons.star : Icons.star_border,
            color: Color(0xFF4C48B7),
            size: 40,
          ),
          onPressed: () {
            _onStarSelected(index + 1);
          },
        );
      }),
    );
  }
}

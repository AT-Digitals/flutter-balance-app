import 'package:flutter/material.dart';
import 'package:balance_app/pages/forms/LoginScreen.dart';
import 'package:balance_app/pages/screens/OnboardingPage.dart';
import 'package:balance_app/pages/screens/hrt_steps/PeriodScreen.dart';
import 'package:balance_app/pages/screens/hrt_steps/GenderPopup.dart';
import 'package:balance_app/pages/screens/hrt_steps/Ethincity.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  // Dropdown items for each of the three dropdowns
 final List<String> _dropdownItems1 = ['Female', 'Male', 'Non-binary', 'Prefer to self-describe', 'Prefer not to say'];
  final List<String> _dropdownItems2 = ['Yes', 'No', 'Prefer not to say'];
  final List<String> _dropdownItems3 = ['White', 'Mixed / Multiple ethnic groups', 'Asian', 'Black / African / Caribbean', 'Other', 'Prefer not to say'];
  final List<String> _dropdownItems4 = ["I don't want to say", 'United Kingdom', 'American Samoa', 'Albania', 'Australia', "Austria", "Brazil", "Brunei", "Bhutan"];

  // Selected items for each dropdown
  String? _selectedItem1;
  String? _selectedItem2;
  String? _selectedItem3;
  String? _selectedItem4;

  // Controllers for DD, MM, and YYYY fields
  TextEditingController _ddController = TextEditingController();
  TextEditingController _mmController = TextEditingController();
  TextEditingController _yyyyController = TextEditingController();

  // Function to show the popup for dropdown
  void _showPopup(BuildContext context, int dropdownNumber) {
    List<String> dropdownItems;
    String? selectedItem;

    switch (dropdownNumber) {
      case 1:
        dropdownItems = _dropdownItems1;
        selectedItem = _selectedItem1;
        break;
      case 2:
        dropdownItems = _dropdownItems2;
        selectedItem = _selectedItem2;
        break;
      case 3:
        dropdownItems = _dropdownItems3;
        selectedItem = _selectedItem3;
        break;
      case 4:
        dropdownItems = _dropdownItems4;  // Use _dropdownItems4 for location
        selectedItem = _selectedItem4;
        break;
      default:
        dropdownItems = [];
        selectedItem = null;
    }

    showDialog(
    context: context,
    barrierDismissible: false, // User must select or cancel the popup
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFFFEEEF4), // Background for the rest of the screen
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AlertDialog(
              // Setting the shape of the AlertDialog to add a border radius for a smoother corner
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              title: Text(
                dropdownNumber == 1
                    ? 'Which of the following best describes you?'
                    : dropdownNumber == 2
                        ? 'Is your gender identity the same as the sex you were registered at birth?'
                        : dropdownNumber == 3
                            ? 'Your Ethnicity'
                            : dropdownNumber == 4
                                ? 'Your location'
                                : '',
                style: TextStyle(
                  color: Colors.black, // Title text color
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              contentPadding: EdgeInsets.zero, // Remove any default padding around content
              content: Container(
                //color: Colors.white, // Set content background to white
                height: 300, // Adjust as needed
                width: 500, // Adjust as needed
                child: ListView.builder(
                  itemCount: dropdownItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(dropdownItems[index]),
                      onTap: () {
                        setState(() {
                          // Update the correct selected item based on the dropdown
                          if (dropdownNumber == 1) {
                            _selectedItem1 = dropdownItems[index];
                          } else if (dropdownNumber == 2) {
                            _selectedItem2 = dropdownItems[index];
                          } else if (dropdownNumber == 3) {
                            _selectedItem3 = dropdownItems[index];
                          } else if (dropdownNumber == 4) {
                            _selectedItem4 = dropdownItems[index];
                          }
                        });
                        Navigator.pop(context); // Close the dialog
                      },
                    );
                  },
                ),
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF4C48B7),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4C48B7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  }

  // Function to check if all fields are valid
  bool _isFormValid() {
    bool isDateValid = _ddController.text.isNotEmpty &&
        _mmController.text.isNotEmpty &&
        _yyyyController.text.isNotEmpty &&
        int.tryParse(_ddController.text) != null &&
        int.tryParse(_mmController.text) != null &&
        int.tryParse(_yyyyController.text) != null;
    bool isDropdownsValid = _selectedItem1 != null &&
        _selectedItem2 != null &&
        _selectedItem3 != null &&
        _selectedItem4 != null;
    return isDateValid && isDropdownsValid;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F5), // Light background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        title: const Text(
          'Your personal details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Your date of birth",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24495A),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // First TextField
                Expanded(
                  child: TextField(
                    controller: _ddController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'DD',
                      hintStyle: TextStyle(
                        color: const Color(0xFF3640BB).withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Second TextField
                Expanded(
                  child: TextField(
                    controller: _mmController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'MM',
                      hintStyle: TextStyle(
                        color: const Color(0xFF3640BB).withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Third TextField
                Expanded(
                  child: TextField(
                    controller: _yyyyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'YYYY',
                      hintStyle: TextStyle(
                        color: const Color(0xFF3640BB).withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE5C7FC)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Dropdown buttons go here...
            
 Text(
              "Which of the following best describes you?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24495A),
              ),
            ),
            const SizedBox(height: 5),
            // First Dropdown Button with down arrow and selected item
            SizedBox(
              width: double.infinity, // Ensures full width
              child:  ElevatedButton(
              onPressed: () {
                _showPopup(context, 1);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                //backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFFE5C7FC), width: 1),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedItem1 ?? 'Select answer', // Show selected item or default text
                    style: TextStyle(
                      color: _selectedItem1 == null
                          ? Colors.black.withOpacity(0.6) // Default color if nothing is selected
                          : Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Color(0xFF4C48B7)), // Down arrow
                ],
              ),
            ),
            ),
            const SizedBox(height: 40),
Text(
              "Is your gender identity the same as the sex you were registered at birth?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24495A),
              ),
            ),
            const SizedBox(height: 5),
            // Second Dropdown Button with down arrow and selected item
            SizedBox(
              width: double.infinity, // Ensures full width
              child: ElevatedButton(
              onPressed: () {
                _showPopup(context, 2);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                //backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFFE5C7FC), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedItem2 ?? 'Select answer', // Show selected item or default text
                    style: TextStyle(
                      color: _selectedItem2 == null
                          ? Colors.black.withOpacity(0.6) // Default color if nothing is selected
                          : Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Color(0xFF4C48B7)), // Down arrow
                ],
              ),
            ),
            ),
            const SizedBox(height: 20),
Center(
  child: Padding(
     padding: EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenderPopup(),
                        ),
                      );
          },
          child: Text(
            "Why do we need this information?",
            textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4C48B7)),
          ),
        ),
 ),
 ),
  const SizedBox(height: 20),
            
Text(
              "Your Ethnicity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24495A),
              ),
            ),
            const SizedBox(height: 5),
            // Third Dropdown Button with down arrow and selected item
            SizedBox(
              width: double.infinity, // Ensures full width
              child: ElevatedButton(
              onPressed: () {
                _showPopup(context, 3);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                //backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFFE5C7FC), width: 1),
              ),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedItem3 ?? 'Select ethnicity', // Show selected item or default text
                    style: TextStyle(
                      color: _selectedItem3 == null
                          ? Colors.black.withOpacity(0.6) // Default color if nothing is selected
                          : Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Color(0xFF4C48B7)), // Down arrow
                ],
              ),
            ),
            ),
            const SizedBox(height: 20),
            Center(
  child: Padding(
     padding: EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ethincity(),
                        ),
                      );
          },
          child: Text(
            "Why do we need this information?",
            textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4C48B7)),
          ),
        ),
 ),
 ),
 const SizedBox(height: 20),

 Text(
              "Your location",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24495A),
              ),
            ),
            const SizedBox(height: 5),
            // Location Dropdown Button with down arrow and selected item
            SizedBox(
              width: double.infinity, // Ensures full width
              child: ElevatedButton(
                onPressed: () {
                  _showPopup(context, 4);  // Show location dropdown
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFFE5C7FC), width: 1),
                ),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedItem4 ?? 'Select a country', // Show selected location or default text
                      style: TextStyle(
                        color: _selectedItem4 == null
                            ? Colors.black.withOpacity(0.6) // Default color if nothing is selected
                            : Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Color(0xFF4C48B7)), // Down arrow
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),



            Center(
              child: ElevatedButton(
                onPressed: _isFormValid()
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingPage(),
                          ),
                        );
                      }
                    : null, // Disable the button if form is not valid
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
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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


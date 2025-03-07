import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/WoopsPage.Dart';
import 'package:balance_app/pages/screens/WrongPage.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Added form key
   bool _isFormValid = false;

  // Validate the code to be a 6-digit number
  String? _validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Code is required';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Please enter a valid 6-digit code';
    }
    return null;
  }

  void _verifyEmail() {
    final code = _codeController.text;
    // Add email verification logic here
    print('Verifying code: $code');
  }
    void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Use form key
           onChanged: _validateForm, // Check form validity on input change
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Verify your email\naddress',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0b5369),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please provide the 6-digit code you\nreceived by email',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xFF0b5369),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Code',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0b5369),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // TextFormField(
                    //   controller: _codeController,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Enter code here',
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   keyboardType: TextInputType.number,
                    //   validator: _validateCode, // Add validation here
                    // ),
                                TextFormField(
                             controller: _codeController,
                             cursorColor: Colors.teal, // Change blinking cursor color
                              style: TextStyle(color: Color(0xFF1E5D6E)), // Change the typing text color
  decoration: InputDecoration(
    hintText: 'Enter code here',
      filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
     hintStyle: TextStyle(
      color: const Color(0xFF3640BB).withOpacity(0.5), // 50% opacity
    ), // Hint text color
    border: OutlineInputBorder(),

    // Default border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(color: Color(0xFF3640BB).withOpacity(0.5), width: 2), // 50% opacity
    ),
     focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3640BB), width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),

  ),

 keyboardType: TextInputType.number,
                              validator: _validateCode,

),
                    const SizedBox(height: 20),
                   
                     Container(
  // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0), // Adjust the margin as needed
  child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(

             onPressed: (){
     // Wrap the logic inside a function
        if (_formKey.currentState!.validate()) {
          String code = _codeController.text.trim(); // Ensure it's a string and remove extra spaces

          if (code == "123456") {
            // Navigate to the WoopsPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WoopsPage(),
              ),
            );
          } else {
            // Navigate to WrongPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WrongPage(),
              ),
            );
          }
        }
             },



                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    backgroundColor:    _isFormValid ? const Color(0xFF3640BB): const Color(0xFF3640BB).withOpacity(0.5),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(color:  _isFormValid ? Colors.white: const Color(0xFFE5C1F5).withOpacity(0.5), fontSize: 16.0),
                  ),
                ),
              ),
          ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

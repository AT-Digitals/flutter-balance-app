import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _emailController = TextEditingController();

  void _requestReset() {
    final email = _emailController.text;
    // Add your reset logic here
    print('Requesting reset for: $email');
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
          'Reset Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200.0),
              Text(
                'Your email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              SizedBox(height: 8.0),
             
                           Container(
  // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0), // Adjust the margin as needed
  child: TextFormField(
                              controller: _emailController,
  decoration: InputDecoration(
    hintText: 'e.g. sandra@example.com',
      filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
     hintStyle: TextStyle(
      color: const Color(0xFF3640BB).withOpacity(0.5), // 50% opacity
    ), // Hint text color
    border: OutlineInputBorder(),

    // Default border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromRGBO(30, 93, 110, 0.1), width: 2), // 50% opacity
    ),

  ),

keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
),
          ),
              SizedBox(height: 20.0),
             Container(
  // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0), // Adjust the margin as needed
  child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, request the password reset
                      _requestReset();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    backgroundColor: Color(0xFF3640BB).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text(
                    'Request reset',
                    style: TextStyle(color: Color(0xFFE5C1F5).withOpacity(0.5), fontSize: 16.0),
                  ),
                ),
              ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}

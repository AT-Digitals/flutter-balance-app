import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/EmailNotReceivedPage.dart';
import 'package:balance_app/pages/forms/CheckEmailPage.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Must contain at least one uppercase letter';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Must contain at least one lowercase letter';
    }
    if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
      return 'Must contain at least one special character';
    }
    if (value.length < 8) {
      return 'Must be at least 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              const SizedBox(height: 10),
              // const TextField(
              //   decoration: InputDecoration(
              //     hintText: 'e.g. Sandra B',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
                            TextFormField(
                             cursorColor: Colors.teal, // Change blinking cursor color
                              style: TextStyle(color: Color(0xFF1E5D6E)), // Change the typing text color
  decoration: InputDecoration(
    hintText: 'e.g. Sandra B',
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
      borderSide:  BorderSide(color: Color(0xFF3640BB).withOpacity(0.5), width: 2), // 50% opacity
    ),
     focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3640BB), width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),

  ),

),

              const SizedBox(height: 30),
              const Text(
                'Your email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                             controller: _emailController,
                             cursorColor: Colors.teal, // Change blinking cursor color
                              style: TextStyle(color: Color(0xFF1E5D6E)), // Change the typing text color
  decoration: InputDecoration(
    hintText: 'Enter your email here',
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

 keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}\$').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
),


              const SizedBox(height: 30),
              const Text(
                'Create a password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                 cursorColor: Colors.teal, // Change blinking cursor color
                decoration: InputDecoration(
                  hintText: 'Enter a password',
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
      borderSide:  BorderSide(color: Color(0xFF3640BB).withOpacity(0.5), width: 2), // 50% opacity
    ),
     focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3640BB), width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: _validatePassword,
              ),
              const SizedBox(height: 10),
              const Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: 'A',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
      TextSpan(
        text: ' One uppercase   ',
        style: TextStyle(
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
      TextSpan(
        text: 'a',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
      TextSpan(
        text: ' One lowercase\n% One special e.g. #!?\n',
        style: TextStyle(
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
      TextSpan(
        text: '8+',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
      TextSpan(
        text: ' Eight plus characters',
        style: TextStyle(
          fontSize: 16, // Set font size
          color: Color(0xFF0b5369),
        ),
      ),
    ],
  ),
),

              const SizedBox(height: 30),
              const Text(
                'Confirm password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordController,
                 cursorColor: Colors.teal, // Change blinking cursor color
                decoration: InputDecoration(
                  hintText: 'Enter password again',
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
      borderSide:  BorderSide(color: Color(0xFF3640BB).withOpacity(0.5), width: 2), // 50% opacity
    ),
     focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3640BB), width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF4C47F7)),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscureConfirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is required';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text;
                    if (email == "premila@gmail.com") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailNotReceivedPage()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckEmailPage()));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C47F7),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
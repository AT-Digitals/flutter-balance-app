import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/EmailNotReceivedPage.dart';
import 'package:balance_app/pages/forms/CheckEmailPage.dart';
import 'package:balance_app/pages/screens/WoopsPage.Dart';

class CreateAccountForm extends StatefulWidget {
   final VoidCallback onNext; // Callback function
const CreateAccountForm({required this.onNext, Key? key}) : super(key: key); // Constructor update

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasSpecialChar = false;
  bool _hasMinLength = false;

   bool _isFormValid = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
     _nameController.dispose();
    super.dispose();
  }

  void _validatePasswordRules(String value) {
    setState(() {
      _hasUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
      _hasLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
      _hasSpecialChar = RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value);
      _hasMinLength = value.length >= 8;
    });
  }
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (!_hasUpperCase) return 'Must contain at least one uppercase letter';
    if (!_hasLowerCase) return 'Must contain at least one lowercase letter';
    if (!_hasSpecialChar) return 'Must contain at least one special character';
    if (!_hasMinLength) return 'Must be at least 8 characters long';
    return null;
  }
String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Email is required';
  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
    return 'Enter a valid Gmail address';
  }
  return null;
}
String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Confirm password is required';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }
    Color _getRuleColor(bool isValid) =>
      isValid ? const Color(0xFF3640BB).withOpacity(0.5) : const Color(0xFF0b5369);

    void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }  

      
  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   }
  //   if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
  //     return 'Must contain at least one uppercase letter';
  //   }
  //   if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
  //     return 'Must contain at least one lowercase letter';
  //   }
  //   if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
  //     return 'Must contain at least one special character';
  //   }
  //   if (value.length < 8) {
  //     return 'Must be at least 8 characters long';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Form(
        key: _formKey,
        onChanged: _validateForm, // Check form validity on input change
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
                              validator: _validateEmail,

),


              const SizedBox(height: 30),
              const Text(
                'Create a password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E5D6E)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                onChanged: _validatePasswordRules,
                 cursorColor: Colors.teal, // Change blinking cursor color
                decoration: InputDecoration(
                  hintText: 'Enter a password',
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
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Color(0xFF4C47F7)),
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
              const SizedBox(height: 20),


          /// Dynamic Password Requirements
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'A ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _getRuleColor(_hasUpperCase)),
                ),
                TextSpan(
                  text: 'One uppercase   ',
                  style: TextStyle(
                      fontSize: 16, color: _getRuleColor(_hasUpperCase)),
                ),
                TextSpan(
                  text: 'a ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _getRuleColor(_hasLowerCase)),
                ),
                  TextSpan(
                  text: 'One lowercase\n',
                  style: TextStyle(
                      fontSize: 16,
                      color: _getRuleColor(_hasLowerCase)),
                ),
                TextSpan(
                  text: '% One special e.g. #!?\n',
                  style: TextStyle(
                      fontSize: 16, color: _getRuleColor(_hasSpecialChar)),
                ),
                TextSpan(
                  text: '8+ ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _getRuleColor(_hasMinLength)),
                ),
                TextSpan(
                  text: 'Eight plus characters',
                  style: TextStyle(
                      fontSize: 16, color: _getRuleColor(_hasMinLength)),
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
                 validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 20),
                        Container(
  // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0), // Adjust the margin as needed
  child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                onPressed: _isFormValid
    ? () {
        if (_formKey.currentState!.validate()) {
          String email = _emailController.text;
          if (email == "premila@gmail.com") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  WoopsPage(),
              ),
            );
          } else {
            // Navigate or call `onNext`
           widget.onNext();
          }
        }
      }
    : () {},

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    backgroundColor:   _isFormValid ? const Color(0xFF3640BB): const Color(0xFF3640BB).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(color: _isFormValid ? Colors.white: const Color(0xFFE5C1F5).withOpacity(0.5), fontSize: 16.0),
                  ),
                ),
              ),
          ),

  // Container(
  // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0), // Uncomment if needed
  // child: SizedBox(
  //   width: double.infinity,
  //   child: ElevatedButton(
  //     onPressed: widget.onNext, // Remove parentheses
  //     child: Text(
  //       'Next',
  //       style: TextStyle(
  //         color: _isFormValid ? Colors.white : const Color(0xFFE5C1F5).withOpacity(0.5),
  //         fontSize: 16.0,
  //       ),
  //     ),
  //   ),
  // ),


  //         ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}


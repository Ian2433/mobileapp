import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'temp_storage.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Add controller for username
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(); // Add controller for phone
  DateTime? _selectedDate;
  bool _passwordsMatch = true;

  void _checkPasswordsMatch() {
    setState(() {
      _passwordsMatch = _passwordController.text == _confirmPasswordController.text;
    });
  }

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DADF7), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sign Up Title
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Username Text Field
              TextField(
                controller: _usernameController, // Use the controller for username
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Password Text Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                onChanged: (value) => _checkPasswordsMatch(),
              ),
              SizedBox(height: 15),

              // Confirm Password Text Field
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                onChanged: (value) => _checkPasswordsMatch(),
              ),
              SizedBox(height: 15),

              // Birthday Date Picker
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Birthday'
                            : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Phone Number Text Field
              TextField(
                controller: _phoneController, // Use the controller here
                keyboardType: TextInputType.number, // Change to number keyboard
                maxLength: 11, // Limit to 11 digits
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  LengthLimitingTextInputFormatter(11), // Max length of 11
                ],
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 32.0),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  if (_passwordsMatch) {
                    // Store the user data temporarily
                    UserData.storeUser(_usernameController.text, _passwordController.text);
                    
                    // Optionally navigate to another screen after sign up
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sign up successful!'),
                      ),
                    );
                  } else {
                    // Show an error message if passwords do not match
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords do not match!'),
                      ),
                    );
                  }
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 16.0),

              // Sign In Prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle login navigation
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

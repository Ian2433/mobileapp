import 'package:flutter/material.dart';
import 'signup.dart';
import 'temp_storage.dart'; // Import the temp storage file
import 'home.dart';
 // Import the home screen

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Start at the login screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        // Add more routes as needed
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DADF7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/nps.jpg'),
              ),
              SizedBox(height: 40),

              Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Username Text Field
              TextField(
                controller: _usernameController,
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
              ),
              SizedBox(height: 15),

              // "Continue" Button for Verifying Existing Data
              ElevatedButton(
                onPressed: () {
                  // Validate the username and password using the UserData class
                  if (UserData.validateUser(
                    _usernameController.text,
                    _passwordController.text,
                  )) {
                    // Navigate to Home screen on successful login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  } else {
                    // Show error message if login fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid username or password')),
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
              SizedBox(height: 20),

              // Existing API Button
              ElevatedButton.icon(
                onPressed: () {
                  // Placeholder for future API login functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('API login not implemented yet')),
                  );
                },
                icon: Icon(
                  Icons.login,
                  color: Colors.grey,
                ),
                label: Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.grey),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),

              // Sign up Prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobileapp/Home.dart';
import 'package:mobileapp/atbash.dart';
import 'package:mobileapp/caesar.dart';
import 'package:mobileapp/project.dart';
import 'package:mobileapp/vigenere.dart';

class CipherScreen extends StatefulWidget {
  @override
  _CipherScreenState createState() => _CipherScreenState();
}

class _CipherScreenState extends State<CipherScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    // Handle navigation based on the selected index
    switch (index) {
      case 0: 
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;     
      case 1: // Projects
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProjectScreen()),
        );
        break;
      case 2: // Translate
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CipherScreen()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.lightBlueAccent,
            Colors.lightBlueAccent,
            Colors.lightBlueAccent,
          ],
          radius: 1.5,
          center: Alignment(0.3, -0.5),
          focal: Alignment.center,
          focalRadius: 0.1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Cipher App',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
               
                _buildCipherCard(
                  context,
                  'Atbash Cipher',
                  'The Atbash cipher is a classical substitution cipher that’s super simple but pretty interesting!',
                  'assets/cipher/Atbash.jpg',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Atbash()),
                  ),
                ),
                SizedBox(height: 30),
                // Caesar Cipher Card
                _buildCipherCard(
                  context,
                  'Caesar Cipher',
                  'The Caesar cipher is one of the oldest and simplest encryption techniques, credited to Julius Caesar.',
                  'assets/cipher/Caesar.jpg',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Caesar()),
                  ),
                ),
                SizedBox(height: 30),
                // Vigenere Cipher Card
                _buildCipherCard(
                  context,
                  'Vigenere Cipher',
                  'The Vigenère cipher is a polyalphabetic cipher that uses multiple substitution alphabets based on a keyword.',
                  'assets/cipher/Vigenere.jpg',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Vigenere()),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF4DADF7),
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex, 
        onTap: (index) {
          setState(() {
            _selectedIndex = index; 
            _onItemTapped(index); 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',        
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Translate',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      ),
    );
  }

  Widget _buildCipherCard(BuildContext context, String title, String description,
      String imagePath, VoidCallback onPressed) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00d1ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'View',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],       
      ),      
    );    
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobileapp/Home.dart';
import 'package:mobileapp/cipher.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;      
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProjectScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CipherScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Project',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Here, I showcase one of my work. This project represents a unique journey, '
              'combining creativity and innovation to deliver exceptional user experiences.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '• National Security Council Clone',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 60, // Adjust the radius as needed
                backgroundImage: AssetImage('assets/picture/nsc.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This project was developed by a group that initially anticipated being the last '
              'in the entire class. Despite our expectations, we had a lot of fun throughout '
              'the process.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
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
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.black : Colors.black54,
            ),
            label: 'Home',
          ),         
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              color: _selectedIndex == 2 ? Color(0xFF4DADF7) : Colors.black54,
            ),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Translate',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

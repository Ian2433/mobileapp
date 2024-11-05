import 'package:flutter/material.dart';
import 'package:mobileapp/cipher.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'project.dart'; 

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
  // Handle navigation based on the selected index
  switch (index) {
    case 0: // Home
      Navigator.pushReplacementNamed(context, '/home'); // Adjust this route as needed
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
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(
          'My Portfolio',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/nps.jpg'),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Ian Mark P. Sicad',
                style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Mobile App Developer',
                style: TextStyle(fontSize: 18, color: Colors.white70, letterSpacing: 1.2),
              ),
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I am a 21-year-old tech enthusiast and a third-year BSIT student, born on January 24, 2003. My passion lies in exploring the innovative world of blockchain technology, where I continuously seek to deepen my understanding and uncover new possibilities within this dynamic field.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.facebook.com/trimidimkmk';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset(
                      'assets/icons/facebook.png',
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://x.com/in_mrkkk';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset(
                      'assets/icons/twitterrr.png',
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://github.com/Ian2433';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset(
                      'assets/icons/github.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Want to logout? ',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF4DADF7),
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex, // Update the current index
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update selected index
            _onItemTapped(index); // Navigate to the selected page
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
    );
  }
}

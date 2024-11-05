// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Vigenere extends StatefulWidget {
  const Vigenere({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VigenereState createState() => _VigenereState();
}

class _VigenereState extends State<Vigenere> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  String _result = '';

  // Vigenère Cipher Encoding Function
  String encodeVigenere(String text, String key) {
    key = key.toUpperCase();
    text = text.toUpperCase();
    String result = '';
    int keyIndex = 0;

    for (int i = 0; i < text.length; i++) {
      if (text[i].codeUnitAt(0) >= 65 && text[i].codeUnitAt(0) <= 90) {
        // A-Z only
        int charCode = ((text[i].codeUnitAt(0) - 65) +
                    (key[keyIndex].codeUnitAt(0) - 65)) %
                26 +
            65;
        result += String.fromCharCode(charCode);
        keyIndex = (keyIndex + 1) % key.length;
      } else {
        result += text[i];
      }
    }
    return result;
  }

  void _onEncodePressed() {
    setState(() {
      _result = encodeVigenere(_textController.text, _keyController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
    Color.fromARGB(255, 173, 216, 230), // Brighter light blue
    Color.fromARGB(255, 135, 206, 250), // Sky blue
    Color.fromARGB(255, 176, 224, 230), // Light steel blue
],
          radius: 1.5,
          center: Alignment(0.3, -0.5), // Adjust to position the glow
          focal: Alignment.center,
          focalRadius: 0.1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Row(
                children: [
                  Text(
                    'Vigenere Cipher',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),

            // Text Field for Vigenere Cipher Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00d1FF)),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter Text here...',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Text Field for Key Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _keyController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00d1FF)),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter Key here...',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Encode Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: _onEncodePressed,
                child: Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF00D1FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Encode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
            SizedBox(height: 20),

            // Result Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                readOnly: true,
                controller: TextEditingController(text: _result),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00d1FF)),
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

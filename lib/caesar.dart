// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import if not already added

class Caesar extends StatefulWidget {
  const Caesar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaesarState createState() => _CaesarState();
}

class _CaesarState extends State<Caesar> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController shiftController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String shiftDirection = 'Right';

  // Caesar cipher function
  String performCaesarCipher(String input, int shift, String direction) {
    if (direction == 'Left') {
      shift = -shift;
    }

    return input.split('').map((char) {
      if (char.isNotEmpty && char.contains(RegExp(r'[a-zA-Z]'))) {
        int base =
            char.codeUnitAt(0) >= 65 && char.codeUnitAt(0) <= 90 ? 65 : 97;
        return String.fromCharCode(
            ((char.codeUnitAt(0) - base + shift) % 26 + 26) % 26 + base);
      }
      return char;
    }).join('');
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
          center: Alignment(0.3, -0.5),
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
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    Text(
                      'CAESAR Cipher',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),

              // Text Field for Caesar Cipher Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: inputController,
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

              // Number Field for Shift Amount
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: shiftController, // Set the controller here
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Allow digits only
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF00d1FF)),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Enter a number...',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Dropdown for Shift Direction
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DropdownButtonFormField<String>(
                  value: shiftDirection,
                  items: ['Right', 'Left']
                      .map((direction) => DropdownMenuItem(
                            value: direction,
                            child: Text(direction),
                          ))
                      .toList(),
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
                  onChanged: (newDirection) {
                    setState(() {
                      shiftDirection = newDirection!;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              // Decode Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {
                    final inputText = inputController.text;
                    final shiftValue = int.tryParse(shiftController.text) ?? 0;
                    final result = performCaesarCipher(
                        inputText, shiftValue, shiftDirection);
                    setState(() {
                      resultController.text = result;
                    });
                  },
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

              // Result Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Result Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: resultController,
                  readOnly: true,
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
            ],
          ),
        ),
      ),
    );
  }
}

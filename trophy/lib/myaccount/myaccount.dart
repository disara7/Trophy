import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/navBar/navbar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController _dobController = TextEditingController();
  TextEditingController _contactController =
      TextEditingController(text: '0779449333');
  TextEditingController _addressController =
      TextEditingController(text: 'No.74A, Lewelle road');
  TextEditingController _nicController =
      TextEditingController(text: '2000000000');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MY ACCOUNT',
        coinCount: 520,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/user.jpeg'), // Make sure the image is in the assets folder and included in pubspec.yaml
                ),
                SizedBox(height: 10),
                Text(
                  'Firstname Lastname',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Position',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Since 2014',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(41, 255, 153, 0),
                    borderRadius:
                        BorderRadius.circular(12), // Adding border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _contactController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Number',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _nicController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'NIC',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _dobController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date of Birth',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onItemSelected: (index) {
        // Handle navigation item selection
      }),
    );
  }
}

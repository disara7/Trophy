import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/navBar/navbar.dart';
import 'package:trophy/themes/button_styles.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController _dobController =
      TextEditingController(text: '1999-07-01');
  TextEditingController _contactController =
      TextEditingController(text: '0779449333');
  TextEditingController _addressController =
      TextEditingController(text: 'No.74A, Lewelle road');
  TextEditingController _nicController =
      TextEditingController(text: '2000000000');

  String firstname = 'Firstname';
  String lastname = 'Lastname';
  String position = 'Position';
  String since = '2014';

  DateTime bday = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bday,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _saveChanges() {
    // Implement saving changes logic here
    // Example: Save updated contact, address, NIC, and DOB
    String updatedContact = _contactController.text;
    String updatedAddress = _addressController.text;
    String updatedNIC = _nicController.text;
    String updatedDOB = _dobController.text;

    // Print or save these values as per your application's requirements
    print('Updated Contact Number: $updatedContact');
    print('Updated Address: $updatedAddress');
    print('Updated NIC: $updatedNIC');
    print('Updated Date of Birth: $updatedDOB');

    // Optionally, show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Changes saved successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
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
            padding: EdgeInsets.all(18),
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
                  '$firstname $lastname',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  position,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Since $since',
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
                      SizedBox(height: 20),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ButtonStyles.elevatedButtonStyle,
                  child: Text('Save Changes'),
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

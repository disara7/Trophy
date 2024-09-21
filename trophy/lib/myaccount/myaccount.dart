import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/constants.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:trophy/themes/button_styles.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';


class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final TextEditingController _dobController =
  TextEditingController(text: '1999-07-01');
  final TextEditingController _contactController =
  TextEditingController(text: '0779449333');
  final TextEditingController _addressController =
  TextEditingController(text: 'No.74A, Lewelle road');
  final TextEditingController _nicController =
  TextEditingController(text: '2000000000');

  String employeeName = 'Employee Name';
  String position = 'Software Engineer';
  String since = '2014';
  String imageUrl = '';


  DateTime bday = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchEmployeeData();
  }

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage(_imageFile!);
    }
  }

  Future<void> _uploadImage(File image) async {
    final compressedImage = await _compressImage(image);

    if (compressedImage != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/api/uploadProfile'));

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      request.files.add(await http.MultipartFile.fromPath('image', compressedImage.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image uploaded successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image upload failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image compression failed')),
      );
    }
  }


  Future<XFile?> _compressImage(File image) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = path.join(dir.absolute.path, "compressed_${path.basename(image.path)}");

      var compressedImage = await FlutterImageCompress.compressAndGetFile(
        image.absolute.path,
        targetPath,
        quality: 50,
      );

      return compressedImage;
    } catch (e) {
      print("Image compression error: $e");
      return null;
    }
  }

  Future<void> _fetchEmployeeData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(
        Uri.parse('$baseUrl/api/fetchMyData'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          employeeName = data['employeeName'] ?? 'Employee Name';
          position = data['position'] ?? 'Software Engineer';
          since = '2014';
          _contactController.text = data['phoneNumber'] ?? '';
          _addressController.text = data['address'] ?? '';
          _nicController.text = data['NIC'] ?? '';
          _dobController.text = data['bday'] ?? '1999-07-01';
          _dobController.text = DateTime.parse(data['bday'] ?? '1999-07-01')
              .toLocal()
              .toIso8601String()
              .split('T')[0];

          bday = DateTime.parse(data['bday'] ?? '1999-07-01').toLocal();
          imageUrl = data['profileUrl'] ?? '';
          print("imageUrl");
        });
      } else {
        throw Exception('Failed to load employee data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching data: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }


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

  void _saveChanges() async {
    String updatedContact = _contactController.text;
    String updatedAddress = _addressController.text;
    String updatedNIC = _nicController.text;
    String updatedDOB = _dobController.text;

    final body = json.encode({
      'phoneNumber': updatedContact,
      'address': updatedAddress,
      'NIC': updatedNIC,
      'bday': updatedDOB,
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.post(
        Uri.parse('$baseUrl/api/updateMyData'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Changes saved successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving changes: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MY ACCOUNT',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color(0xFF222222),
                      backgroundImage: imageUrl.startsWith('https')
                          ? NetworkImage(imageUrl)
                          : null,
                      child: imageUrl.startsWith('https')
                          ? null // No icon if there is a valid image
                          : const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  employeeName,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  position,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Since $since',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(41, 255, 153, 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _contactController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Contact Number',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Address',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _nicController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'NIC',
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _dobController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Date of Birth',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: const Icon(Icons.calendar_today),
                          ),
                        ),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ButtonStyles.elevatedButtonStyle,
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  String _selectedType = 'Type1'; // Default selected type
  DateTime _selectedDateTime = DateTime.now();

  final _titleController = TextEditingController();

  List<String> _types = ['Type1', 'Type2', 'Type3', 'Type4']; // Default types

  @override
  void initState() {
    super.initState();
    // Fetch types from the endpoint when the page is initialized
    _fetchTypes();
  }

  Future<void> _fetchTypes() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/types'));
      if (response.statusCode == 200) {
        final List<dynamic> typesJson = json.decode(response.body);
        setState(() {
          _types = typesJson.map<String>((type) => type.toString()).toList();
          print(_types);
        });
      } else {
        // Handle errors when fetching types
        print('Failed to fetch types. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error fetching types: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title:'),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Enter title',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Type:'),
            DropdownButton<String>(
              value: _selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: _types.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Date and Time:'),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text(
                DateFormat('MMMM d, yyyy - hh:mm a').format(_selectedDateTime),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                _submitForm();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    String title = _titleController.text;
    String type = _selectedType;
    DateTime dateTime = _selectedDateTime;

    // Prepare data for the POST request
    Map<String, dynamic> requestData = {
      'title': title,
      'type': type,
      'dateTime': dateTime
          .toUtc()
          .toIso8601String(), // Convert to UTC and ISO8601 format
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/activity/add'),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful submission, navigate to the dashboard
        Navigator.pushReplacementNamed(
            context, '/dashboard'); // Replace with your dashboard route
      } else {
        // Handle errors when submitting the form
        print('Failed to submit form. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error submitting form: $e');
    }
  }
}

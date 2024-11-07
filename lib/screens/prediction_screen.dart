import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _avgRainfallController = TextEditingController();
  final TextEditingController _avgTemperatureController = TextEditingController();
  final TextEditingController _pesticidesTonnesController = TextEditingController();

  String predictedYield = '';

  Future<void> predictYield() async {
    final url = 'https://af08-156-0-144-158.ngrok-free.app/predict';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'Country': _countryController.text,
          'Item': _itemController.text,
          'Avg_Rainfall': parseDouble(_avgRainfallController.text),
          'Avg_Temperature': parseDouble(_avgTemperatureController.text),
          'Pesticides_Tonnes': parseDouble(_pesticidesTonnesController.text),
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          predictedYield = json.decode(response.body)['predicted_yield'].toString();
          _clearForm(); // Clear text fields after a successful prediction
        });
      } else {
        setState(() {
          predictedYield = 'Error: ${json.decode(response.body)['error']}';
        });
      }
    } catch (e) {
      print('Error during API call: $e');
      setState(() {
        predictedYield = 'Error occurred during prediction';
      });
    }
  }

  // Helper method to handle input changes safely
  double parseDouble(String value, [double defaultValue = 0.0]) {
    try {
      return double.parse(value);
    } catch (e) {
      return defaultValue;
    }
  }

  // Method to clear the form
  void _clearForm() {
    _countryController.clear();
    _itemController.clear();
    _avgRainfallController.clear();
    _avgTemperatureController.clear();
    _pesticidesTonnesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predict Crop Yield'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back5.jpeg'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: BoxConstraints.expand(),  // Ensures full height coverage
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: kToolbarHeight + 20), // Space for AppBar
                    TextFormField(
                      controller: _countryController,
                      decoration: InputDecoration(
                        labelText: 'Country',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _itemController,
                      decoration: InputDecoration(
                        labelText: 'Crop',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _avgRainfallController,
                      decoration: InputDecoration(
                        labelText: 'Avg Rainfall (mm)',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _avgTemperatureController,
                      decoration: InputDecoration(
                        labelText: 'Avg Temperature (°C)',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _pesticidesTonnesController,
                      decoration: InputDecoration(
                        labelText: 'Pesticides Tonnes',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          predictYield();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // Button color
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ensure text is white
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        elevation: 10, // Increased elevation for more prominence
                      ),
                      child: Text(
                        'Predict Yield',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      predictedYield.isNotEmpty
                          ? 'Predicted Yield: $predictedYield'
                          : '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _countryController.dispose();
    _itemController.dispose();
    _avgRainfallController.dispose();
    _avgTemperatureController.dispose();
    _pesticidesTonnesController.dispose();
    super.dispose();
  }
}

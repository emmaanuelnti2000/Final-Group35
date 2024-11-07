
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back5.jpeg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Contact Info Section
              _buildContactInfoSection(),
              SizedBox(height: 30),
              // Contact Form Section
              _buildContactFormSection(context),
              SizedBox(height: 30),
              // Location Map Section
              _buildLocationMapSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'For inquiries and support, please contact us at:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'support@yieldprediction.com',
              );
              await launchUrl(emailLaunchUri);
            },
            child: Text(
              'support@yieldprediction.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'oforif534@gmail.com',
              );
              await launchUrl(emailLaunchUri);
            },

            child: Text(
              'oforif534@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final Uri phoneLaunchUri = Uri(
                scheme: 'tel',
                path: '+233554249882',
              );
              await launchUrl(phoneLaunchUri);
            },

            child: Text(
              '+233 55 424 9882',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Or reach out to us on social media:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(FontAwesomeIcons.facebook, Colors.blueAccent, () {
                // Handle Facebook link
              }),
              _buildSocialIcon(FontAwesomeIcons.twitter, Colors.lightBlueAccent, () {
                // Handle Twitter link
              }),
              _buildSocialIcon(FontAwesomeIcons.linkedin, Colors.blue, () {
                // Handle LinkedIn link
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, VoidCallback onPressed) {
    return IconButton(
      icon: FaIcon(icon),
      color: color,
      onPressed: onPressed,
    );
  }

  Widget _buildContactFormSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Contact Form',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          _buildTextField('Name', Icons.person, nameController),
          SizedBox(height: 10),
          _buildTextField('Email', Icons.email, emailController),
          SizedBox(height: 10),
          _buildTextField('Message', Icons.message, messageController, maxLines: 5),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Show confirmation message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message sent successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Clear the text fields
              nameController.clear();
              emailController.clear();
              messageController.clear();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Set button color here
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black87),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildLocationMapSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Visit Us At:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/map.jpg', // Replace with your map image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

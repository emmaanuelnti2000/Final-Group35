import 'dart:ui'; // Import dart:ui for the blur effect.
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to sign up';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(), // The blurred background
          _buildSignUpForm(), // The sign-up form
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/back5.jpeg',
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur effect
          child: Container(
            color: Colors.black.withOpacity(0.2), // Optional: Add translucent overlay
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
              isPassword: false,
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            SizedBox(height: 20),
            _buildSignUpButton(),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(errorMessage, style: TextStyle(color: Colors.red)),
              ),
            _buildLoginLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: _signUp,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ), // Button background color
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildLoginLink() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Text(
        'Already have an account? Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

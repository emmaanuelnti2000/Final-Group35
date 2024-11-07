import 'dart:ui'; // Import the dart:ui package for the blur effect.
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      _showError('Failed to sign in. Please check your credentials.');
    }
  }

  void _showError(String message) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          _buildBackground(),  // The blurred background image
          _buildLoginForm(),   // The login form UI
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
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur effect with sigmaX and sigmaY for horizontal and vertical blurring
          child: Container(
            color: Colors.black.withOpacity(0.2), // Optional: Add a translucent overlay
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
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
            _buildLoginButton(),
            SizedBox(height: 10),
            _buildSignupLink(),
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
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ), // Button background color
      ),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildSignupLink() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
      child: Text(
        "Don't have an account? Sign up",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

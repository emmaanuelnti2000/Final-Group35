import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back5.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          // Gradient overlay for better text contrast
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.5),
                radius: 1.5,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          // Welcome message
                          AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(seconds: 2),
                            child: Text(
                              'Welcome to Crop Yield Prediction',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.5,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Subtitle
                          Text(
                            'Accurate Forecasts for Better Planning',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildSquareButton(
                            context,
                            label: 'Predict',
                            icon: Icons.analytics,
                            color: Colors.greenAccent,
                            route: '/prediction',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildSquareButton(
                            context,
                            label: 'About',
                            icon: Icons.info_outline,
                            color: Colors.blueAccent,
                            route: '/about',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildSquareButton(
                            context,
                            label: 'Contact',
                            icon: Icons.contact_mail,
                            color: Colors.orangeAccent,
                            route: '/contact',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          // Logout Button
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ), // Change the color as needed
              ),
              child: Row(
                children: [
                  Icon(Icons.logout, size: 24),
                  SizedBox(width: 8),
                  Text('Logout', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Square IconButton with label
  Widget _buildSquareButton(BuildContext context,
      {required String label,
        required IconData icon,
        required Color color,
        required String route}) {
    return AspectRatio(
      aspectRatio: 1, // Ensures the button is square
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          padding: EdgeInsets.all(20), // Adjusted padding for better fit
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Slightly rounded corners
          ),
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 8, // Increased elevation for better shadow
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48), // Increased icon size
            SizedBox(height: 10), // Space between icon and label
            Text(label), // Label under the icon
          ],
        ),
      ),
    );
  }
}

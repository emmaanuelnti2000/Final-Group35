import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/prediction_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBuP7OZvsVzGoxHIOu4_DKQA70Ee4jl3UU",
        authDomain: "crop-93bac.firebaseapp.com",
        projectId: "crop-93bac",
        storageBucket: "crop-93bac.appspot.com",
        messagingSenderId: "978111752361",
        appId: "1:978111752361:web:af77461e35d2c1e13e21b8",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(YieldPredictionApp());
}

class YieldPredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yield Prediction',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/prediction': (context) => PredictionScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
      },
    );
  }
}

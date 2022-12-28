// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this

import 'package:app_food_delivery/providers/auth_provider.dart';
import 'package:app_food_delivery/screens/forgetPass_screen.dart';
import 'package:app_food_delivery/screens/home_screen.dart';
import 'package:app_food_delivery/screens/login_screen.dart';
import 'package:app_food_delivery/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  MyApp({required this.prefs});
  final SharedPreferences prefs;

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('An error occured'),
              ),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<Auth>(
              create: (context) => Auth(prefs: this.prefs),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.transparent,
            ),
            home: LoginScreen(),
            routes: {
              LoginScreen.routeName: (context) => LoginScreen(),
              SignUpScreen.routeName: (context) => SignUpScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
            },
          ),
        );
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:app_food_delivery/providers/auth_provider.dart';
import 'package:app_food_delivery/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Sign Out'),
          onPressed: () async {
            await Provider.of<Auth>(context, listen: false).handleSignOut();
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
        ),
      ),
    );
  }
}

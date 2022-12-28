import 'package:app_food_delivery/providers/auth_provider.dart';
import 'package:app_food_delivery/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              await auth.handleSignOut();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            child: const Text('Log out')),
      ),
    );
  }
}

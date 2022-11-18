// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_blackspace

import 'package:app_food_delivery/providers/auth_provider.dart';
import 'package:app_food_delivery/screens/forgetPass_screen.dart';
import 'package:app_food_delivery/screens/home_screen.dart';
import 'package:app_food_delivery/screens/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  /* Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ));
          if (authResult.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(authResult.user!.uid)
                .set({
              'id': authResult.user!.uid,
              'name': authResult.user!.displayName,
              'email': authResult.user!.email,
              'createdAt': Timestamp.now(),
            });
          }
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } on FirebaseException catch (error) {
          Fluttertoast.showToast(msg: error.message!);
        }
      }
    }
  }*/

  void submitLoginForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {});

      try {
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.toLowerCase().trim(),
          password: passController.text.trim(),
        );
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } else {
          return;
        }
      } on FirebaseException catch (error) {
        Fluttertoast.showToast(msg: error.message!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Container(
      /*decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/testna.jpg'),
              fit: BoxFit.cover,
              opacity: 0.3)),*/
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 162, 239, 184).withOpacity(1),
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Color.fromARGB(255, 162, 239, 184).withOpacity(0.9),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 130, left: 30),
              child: Text(
                'Delivery Food',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.4,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )),
                            label: Text(
                              'Enter email',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(passFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Enter a valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          obscureText: isHiddenPassword,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: togglePasswordView,
                              child: Icon(
                                isHiddenPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )),
                            label: Text(
                              'Enter password',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          focusNode: passFocusNode,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).unfocus(),
                          keyboardType: TextInputType.name,
                          controller: passController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Enter a valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 33, 160, 101),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.9, 45),
                          ),
                          onPressed: () {
                            submitLoginForm();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ForgetPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: const Divider(
                                    thickness: 1.0,
                                    color: Colors.black,
                                    height: 36.0,
                                  )),
                            ),
                            Text(
                              "or continue with",
                              style: TextStyle(
                                fontSize: 10.0 *
                                    MediaQuery.of(context).size.width *
                                    0.004,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: const Divider(
                                  thickness: 1.0,
                                  color: Colors.black,
                                  height: 36.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              await auth.googleSignIn();
                              Navigator.of(context)
                                  .pushReplacementNamed(HomeScreen.routeName);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed(
                                    SignUpScreen.routeName);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 33, 160, 101),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

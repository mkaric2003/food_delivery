// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:app_food_delivery/providers/auth_provider.dart';
import 'package:app_food_delivery/screens/food_home_screen.dart';
import 'package:app_food_delivery/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget currentScreen = FoodHomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
          child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Color(0xff675492),
                child: PageStorage(
                  bucket: _bucket,
                  child: currentScreen,
                ),
              )),
          onWillPop: () {
            return Future.value(false);
          }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.grey.shade100,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              left: 6,
              right: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                      currentScreen = const FoodHomeScreen();
                    });
                  },
                  child: index == 0
                      ? Image.asset(
                          'assets/images/home.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        )
                      : Image.asset(
                          'assets/images/home-2.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                      currentScreen = const FoodHomeScreen();
                    });
                  },
                  child: index == 1
                      ? Image.asset(
                          'assets/images/heart.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        )
                      : Image.asset(
                          'assets/images/love.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                      currentScreen = const FoodHomeScreen();
                    });
                  },
                  child: index == 2
                      ? Image.asset(
                          'assets/images/search.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        )
                      : Image.asset(
                          'assets/images/search-1.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      index = 3;
                      currentScreen = const FoodHomeScreen();
                    });
                  },
                  child: index == 3
                      ? Image.asset(
                          'assets/images/settings-2.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        )
                      : Image.asset(
                          'assets/images/settings.png',
                          height: 22,
                          color: Colors.grey.shade800,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

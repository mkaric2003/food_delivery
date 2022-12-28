// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_food_delivery/screens/food_screen.dart';
import 'package:app_food_delivery/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  final _index = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation(
        appBarBuilder: (showMenu) => AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen())),
              child: Container(
                height: 80,
                width: 80,
                child: const FittedBox(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/D4D03AQEY7MQ-nkO9Yg/profile-displayphoto-shrink_400_400/0/1668899503312?e=1674086400&v=beta&t=HXAbtmv3WqOtp8a1BpsnOuge8otUrI6lIwJpSuhKXJs',
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: showMenu,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/images/menu.png',
                    color: Color(0xff1c7d4f),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/images/cart.png',
                    color: Color(0xff1c7d4f),
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        views: [
          FoodScreen(),
        ],
        items: [
          Image.asset('assets/images/crispy1.png'),
          Image.asset('assets/images/chili1.png'),
          Image.asset('assets/images/chicken1.png'),
          Column(
            children: <Widget>[
              Text('Total'),
              SizedBox(
                height: 6,
              ),
              Text('3 Items'),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$22.00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff1c7d4f),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
        position: SideMenuPosition.right,
        selectedColor: Colors.white,
        unselectedColor: Colors.white,
        tapOutsideToDismiss: true,
        scrimColor: Colors.black45,
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) {
            _index.value = value;
          }
        },
      ),
    );
  }
}

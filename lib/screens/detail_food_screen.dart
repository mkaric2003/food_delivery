// ignore_for_file: sized_box_for_whitespace

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class DetailFoodScreen extends StatefulWidget {
  const DetailFoodScreen({Key? key}) : super(key: key);

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          DelayedDisplay(
            delay: const Duration(milliseconds: 300),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                        color: Color(0xffcfdece),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                  ),
                  Positioned(
                    top: 200,
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.45,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 55,
                              left: 20,
                              right: 51,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Crispy\nChicken Fresh',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Fresh Food    Poke',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'The healthiest dish prepare by our experts. Balanced in term of micro and macro elements, contains a minimum amount of elements harmful to the figure.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const <Widget>[
                                        Text(
                                          'Calories',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '250 Kcal',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff1c7d4f),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const <Widget>[
                                        Text(
                                          'Protein',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '15 g',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff1c7d4f),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const <Widget>[
                                        Text(
                                          'Calcium',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '7 g',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff1c7d4f),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const <Widget>[
                                        Text(
                                          'Carbo',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '25 g',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff1c7d4f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff1c7d4f),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Order for \$3.99',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/crispy.png',
                        height: 320,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

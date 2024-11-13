import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization/pages/lang_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blueAccent.withOpacity(0.4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 70, left: 10, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Icon Button Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LanguageSelectionPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.menu),
                      ),
                      Text(
                        tr('appbar'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 24.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("Notification Button Pressed");
                        },
                        icon: Icon(Icons.notifications),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Home Button Pressed");
                          },
                          icon: Icon(Icons.home_filled),
                        ),
                        Text(tr('home')),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Shopping Button Pressed");
                          },
                          icon: Icon(Icons.shopping_bag_outlined),
                        ),
                        Text(tr('shopping')),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Orders Button Pressed");
                          },
                          icon: Icon(Icons.insert_invitation),
                        ),
                        Text(tr('orders')),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Profile Button Pressed");
                          },
                          icon: Icon(Icons.account_circle_outlined),
                        ),
                        Text(tr('profile')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(top: 140.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr('title'),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      tr('subtitle'),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

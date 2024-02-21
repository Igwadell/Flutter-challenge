import 'package:flutter/material.dart';
import 'dart:async';

// Make sure these imports point to the correct files in your project

import 'home.dart';
import 'notes.dart';
import 'add.dart';
import 'notification.dart';
import 'profile.dart'; // Ensure this doesn't clash with Flutter's Notification class

class Navigator1 extends StatefulWidget {
  @override
  _Navigator1State createState() => _Navigator1State();
}

class _Navigator1State extends State<Navigator1> {
  int currentIndex = 0;
  final List<Widget> children = [
    Home(),
    Notes(),
    Add(),
    NotificationPage(), // Make sure this class is correctly defined in your notification.dart
    Profile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Updated for best practices
      child: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Color(0xFFEC4E4E),
          onTap: onTappedBar,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              label: "Home", // Updated to String
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined, color: Colors.white),
              label: "Notes", // Updated to String
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, color: Colors.white),
              label: "Add", // Updated to String
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.white),
              label: "Notifications", // Updated to String
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.white),
              label: "Account", // Updated to String
            ),
          ],
        ),
      ),
    );
  }
}

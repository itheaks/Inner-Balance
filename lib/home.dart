import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innerbalance/chatbot.dart';
import 'package:innerbalance/tp.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  final User user;

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    TpScreen(),
    TpScreen(),
    ChatBotPage(),
    TpScreen(),
    TpScreen(),
  ];

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome to IdeaProtect")),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Course",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 65,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            label: "Chatbot",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "About",
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pinkAccent.shade100,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game1.dart';
import 'game2.dart';
import 'game3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDashboard(),
    );
  }
}

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int game1TimesPlayed = 0;
  int game1HighestScore = 0;
  int game2TimesPlayed = 0;
  int game2HighestScore = 0;
  int game3TimesPlayed = 0;
  int game3HighestScore = 0;

  @override
  void initState() {
    super.initState();
    loadGameData();
  }

  Future<void> loadGameData() async {
    final prefs = await SharedPreferences.getInstance();
    game1TimesPlayed = prefs.getInt('game1_timesPlayed') ?? 0;
    game1HighestScore = prefs.getInt('game1_highestScore') ?? 0;
    game2TimesPlayed = prefs.getInt('game2_timesPlayed') ?? 0;
    game2HighestScore = prefs.getInt('game2_highestScore') ?? 0;
    game3TimesPlayed = prefs.getInt('game3_timesPlayed') ?? 0;
    game3HighestScore = prefs.getInt('game3_highestScore') ?? 0;
    setState(() {});
  }

  void navigateToGame1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game1()),
    );
  }

  void navigateToGame2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game2()),
    );
  }

  void navigateToGame3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User Dashboard',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: navigateToGame1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Game 1',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Times Played: $game1TimesPlayed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Highest Score: $game1HighestScore',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: navigateToGame2,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Game 2',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Times Played: $game2TimesPlayed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Highest Score: $game2HighestScore',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: navigateToGame3,
              child: Container(
                color: Colors.orange,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Game 3',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Times Played: $game3TimesPlayed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Highest Score: $game3HighestScore',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


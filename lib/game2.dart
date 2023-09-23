import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Comparison Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game2(),
    );
  }
}

class Game2 extends StatefulWidget {
  @override
  _Game2State createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  int number1 = 00;
  int number2 = 00;
  int targetNumber = 0;
  int score = 0;
  Timer? timer;
  bool introductionChecked = false;

  final String gameKey = "game2"; // Unique key for this game's data in SharedPreferences

  @override
  void initState() {
    super.initState();
    loadGameData(); // Load game data when the game starts
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> loadGameData() async {
    final prefs = await SharedPreferences.getInstance();
    final timesPlayed = prefs.getInt('${gameKey}_timesPlayed') ?? 0;
    final highestScore = prefs.getInt('${gameKey}_highestScore') ?? 0;
    setState(() {
      score = 0;
      // You can use timesPlayed and highestScore as needed
    });
  }

  Future<void> saveGameData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${gameKey}_timesPlayed', 1); // Increase timesPlayed by 1
    await prefs.setInt('${gameKey}_highestScore', max(score, prefs.getInt('${gameKey}_highestScore') ?? 0)); // Update highest score
  }

  void startGame() {
    setState(() {
      score = 0;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        generateRandomNumbers();
      });
    });
    Timer(Duration(seconds: 60), () {
      timer?.cancel();
      saveGameData(); // Save game data when the game ends
      showGameOverDialog();
    });
  }

  void generateRandomNumbers() {
    final random = Random();
    number1 = random.nextInt(100);
    number2 = random.nextInt(100);
    targetNumber = random.nextInt(200);
  }

  void handleSelection(bool isGreater) {
    setState(() {
      int sum = number1 + number2;
      if ((isGreater && sum > targetNumber) || (!isGreater && sum < targetNumber)) {
        score++;
      } else {
        score--;
      }
      generateRandomNumbers();
    });
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Time\'s up!'),
              SizedBox(height: 16),
              Text('Your Score: $score', style: TextStyle(fontSize: 18)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Restart'),
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Comparison Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.yellowAccent,
            ],
          ),
        ),
        child: Center(
          child: introductionChecked
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Score: $score',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40),
              Text(
                'Number 1: $number1',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Number 2: $number2',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Target Number: $targetNumber',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => handleSelection(true),
                    child: Text('Greater'),
                  ),
                  ElevatedButton(
                    onPressed: () => handleSelection(false),
                    child: Text('Smaller'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: startGame,
                child: Text('Start'),
              ),
            ],
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Are you ready for this small mind exercise game, here you have to compare the sum of two numbers to the third number and tell whether it is greater or smaller, and if your answer is correct, you will gain +1 point, otherwise, you will lose 1 point. Tick the button to show you are ready and start this one-minute mind game',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Checkbox(
                  value: introductionChecked,
                  onChanged: (value) {
                    setState(() {
                      introductionChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

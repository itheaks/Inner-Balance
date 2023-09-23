import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game1(),
    );
  }
}

class Game1 extends StatefulWidget {
  @override
  _Game1State createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  int currentNumber1 = 0;
  int currentNumber2 = 0;
  int score = 0;
  Timer? timer;
  bool introductionChecked = false;

  final String gameKey = "game1"; // Unique key for this game's data in SharedPreferences

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
    currentNumber1 = random.nextInt(100);
    currentNumber2 = random.nextInt(100);
    while (currentNumber2 == currentNumber1) {
      currentNumber2 = random.nextInt(100);
    }
  }

  void handleNumberTap(int selectedNumber) {
    setState(() {
      if (selectedNumber == currentNumber1 && currentNumber1 < currentNumber2) {
        score++;
      } else if (selectedNumber == currentNumber2 && currentNumber2 < currentNumber1) {
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
              child: Text('Restart'),
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Game'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Score: $score',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40),
              introductionChecked
                  ? Column(
                children: [
                  GestureDetector(
                    onTap: () => handleNumberTap(currentNumber1),
                    child: Text(
                      'Number 1: $currentNumber1',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => handleNumberTap(currentNumber2),
                    child: Text(
                      'Number 2: $currentNumber2',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: startGame,
                    child: Text('Start'),
                  ),
                ],
              )
                  : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Are you ready for this small mind exercise game, here you have to choose the smallest number out of two numbers, and if your answer is correct, you will gain +1 point, otherwise, you will lose 1 point. Tick the button to show you are ready and start this one-minute mind game',
                      style: TextStyle(fontSize: 18),
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
            ],
          ),
        ),
      ),
    );
  }
}

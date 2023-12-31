import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Match Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game3(),
    );
  }
}

class Game3 extends StatefulWidget {
  @override
  _Game3State createState() => _Game3State();
}

class _Game3State extends State<Game3> {
  bool gameStarted = false;

  void startGame() {
    setState(() {
      gameStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Match Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellowAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Are you ready for this small mind exercise game, here you have to choose the color from the given option below and if your answer is correct you will gain +1 point else you will lose 1 point. Tick the button to show you are ready and start this one-minute mind game',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Checkbox(
                value: gameStarted,
                onChanged: (value) {
                  setState(() {
                    gameStarted = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: gameStarted
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorMatchGame()),
                  );
                }
                    : null,
                child: Text('Start Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorMatchGame extends StatefulWidget {
  @override
  _ColorMatchGameState createState() => _ColorMatchGameState();
}

class _ColorMatchGameState extends State<ColorMatchGame> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  List<String> colorNames = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Purple',
  ];

  Color targetColor = Colors.red;
  String targetColorName = 'Red';

  int score = 0;
  int highScore = 0;
  Timer? timer;

  final String gameKey = "game3"; // Unique key for this game's data in SharedPreferences

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
      highScore = highestScore;
      // You can use timesPlayed and highScore as needed
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
        generateRandomColor();
      });
    });
    Timer(Duration(seconds: 60), () {
      timer?.cancel();
      saveGameData(); // Save game data when the game ends
      showGameOverDialog();
    });
  }

  void generateRandomColor() {
    final random = Random();
    int index = random.nextInt(colors.length);
    targetColor = colors[index];
    targetColorName = colorNames[index];
  }

  void handleColorSelection(Color selectedColor) {
    setState(() {
      if (selectedColor == targetColor) {
        score++;
      } else {
        score--;
      }
      generateRandomColor();
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
        title: Text('Color Match Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellowAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
              SizedBox(height: 20),
              Text(
                'High Score: $highScore',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 100,
                color: targetColor,
              ),
              SizedBox(height: 20),
              Text(
                'Match the color: $targetColorName',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colors
                    .map(
                      (color) => GestureDetector(
                    onTap: () => handleColorSelection(color),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: color,
                    ),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: startGame,
                child: Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  int currentIndex = 0;
  bool isPlaying = false;

  List<Map<String, dynamic>> songs = [
    {
      'title': 'Good Night',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/1.webp?alt=media&token=0e9aa5a2-ac8b-4cfc-9e31-db282d02a142',
      'audioUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/1.mp3?alt=media&token=82413072-4eb8-4a20-939e-b21055a9f0e8',
    },
    {
      'title': 'Leva - Eternity',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/2.webp?alt=media&token=0db8c10b-55ad-4a1a-be97-a3abccdceae0',
      'audioUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/2.mp3?alt=media&token=fd8fac6b-8c1d-4374-a12e-ec39d77a73df',
    },
    {
      'title': 'Relaxed Vlog (Night Street)',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/3.webp?alt=media&token=fb080055-1146-44b4-909b-19bc1798c963',
      'audioUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/3.mp3?alt=media&token=68626f37-780e-4940-8c00-65273ac0736c',
    },
    {
      'title': 'Smoke',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/4.jpg?alt=media&token=0277a4f7-320d-47fb-9d6f-5f816fc730e1',
      'audioUrl': 'https://firebasestorage.googleapis.com/v0/b/inner-balance-58622.appspot.com/o/4.mp3?alt=media&token=5fde137f-03a5-48f8-a471-4644cba4c1ff',
    },
  ];

  CarouselController _carouselController = CarouselController();

  void playSong(int index) async {
    await audioPlayer.stop();
    await audioPlayer.play(songs[index]['audioUrl']);
    setState(() {
      isPlaying = true;
    });
  }

  void pauseSong() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void nextSong() {
    if (currentIndex < songs.length - 1) {
      currentIndex++;
      playSong(currentIndex);
    }
  }

  void previousSong() {
    if (currentIndex > 0) {
      currentIndex--;
      playSong(currentIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    playSong(currentIndex);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: true,
                  initialPage: currentIndex,
                  onPageChanged: (index, reason) {
                    currentIndex = index;
                    playSong(currentIndex);
                  },
                ),
                items: songs.map((song) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          Image.network(
                            song['imageUrl'],
                            width: 250,
                            height: 250,
                          ),
                          SizedBox(height: 20),
                          Text(song['title']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.skip_previous),
                                onPressed: previousSong,
                              ),
                              IconButton(
                                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                onPressed: () {
                                  if (isPlaying) {
                                    pauseSong();
                                  } else {
                                    playSong(currentIndex);
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.skip_next),
                                onPressed: nextSong,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

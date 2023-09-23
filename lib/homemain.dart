import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:googleapis/cloudkms/v1.dart';
import 'package:innerbalance/home.dart';
import 'package:innerbalance/mindgames.dart';
import 'package:innerbalance/relax.dart';
import 'package:innerbalance/suggestion.dart';
import 'package:innerbalance/tp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeMainScreen(),
    );
  }
}

class HomeMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Interestings Facts',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 0.9 * MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: [
                    _buildFactCard(
                      'Spending time in nature has been proven to reduce stress and anxiety, making it a powerful tool for enhancing mental health in the digital age.',
                      Colors.blue,
                    ),

                    _buildFactCard(
                      'Practicing mindfulness can help individuals stay grounded and reduce the impact of digital stressors.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'Regularly disconnecting from screens and devices can significantly reduce the negative effects of information overload.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'Simple deep-breathing exercises can help manage anxiety triggered by online harassment or social media pressure.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'Reducing screen time, especially before bedtime, can improve sleep quality and overall mental well-being.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'Pursuing offline hobbies and interests can provide a welcome break from the digital world.',
                      Colors.red,
                    ),

                    _buildFactCard(
                      'Regular exercise is essential for maintaining mental health and combating the sedentary nature of digital lifestyles.',
                      Colors.teal,
                    ),

                    _buildFactCard(
                      'Many digital tools and apps offer therapy and mental health support, making help more accessible.',
                      Colors.cyan,
                    ),

                    _buildFactCard(
                      'Online forums and communities can provide valuable support for individuals facing similar digital-age challenges.',
                      Colors.deepOrange,
                    ),

                    _buildFactCard(
                      'Creating a structured routine for screen use can prevent excessive browsing and social media consumption.',
                      Colors.indigo,
                    ),

                    _buildFactCard(
                      'Periodic breaks from social media can reduce the pressure to compare oneself to others.',
                      Colors.blue,
                    ),

                    _buildFactCard(
                      'Prioritize face-to-face interactions over virtual ones to combat feelings of isolation.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'Writing down thoughts and feelings can provide clarity and reduce anxiety related to digital stressors.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'Taking extended breaks from the digital world, like weekends or vacations, can rejuvenate mental health.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'Raising awareness about online harassment and its effects is crucial for addressing this issue.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'Educating oneself about online privacy measures can reduce feelings of vulnerability online.',
                      Colors.red,
                    ),

                    _buildFactCard(
                      'Using blue light filters on screens can improve sleep patterns and reduce digital eye strain.',
                      Colors.teal,
                    ),

                    _buildFactCard(
                      'Developing emotional intelligence can help individuals better navigate online conflicts and negativity.',
                      Colors.cyan,
                    ),

                    _buildFactCard(
                      'Keeping digital devices out of the bedroom can promote better sleep and relaxation.',
                      Colors.deepOrange,
                    ),

                    _buildFactCard(
                      'Setting clear boundaries for digital device usage can prevent burnout.',
                      Colors.indigo,
                    ),

                    _buildFactCard(
                      'Repeating positive affirmations can counteract negative self-perception fostered by social media pressure.',
                      Colors.blue,
                    ),

                    _buildFactCard(
                      'Developing digital literacy skills can empower individuals to critically assess online information.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'Engaging in laughter and humor can reduce stress and promote mental well-being.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'Pursuing creative endeavors can provide an outlet for self-expression and stress relief.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'Helping others online or offline can foster a sense of purpose and improve mental health.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'Engaging in online learning can boost self-esteem and provide a sense of accomplishment.',
                      Colors.red,
                    ),

                    _buildFactCard(
                      'Balancing negative news with positive stories can reduce anxiety.',
                      Colors.teal,
                    ),

                    _buildFactCard(
                      'Joining online support groups for mental health can provide valuable insights and encouragement.',
                      Colors.cyan,
                    ),

                    _buildFactCard(
                      'Utilizing digital tools for time management can reduce stress related to deadlines and multitasking.',
                      Colors.deepOrange,
                    ),

                    _buildFactCard(
                      'Apps that guide breathing exercises can be effective for immediate stress relief.',
                      Colors.indigo,
                    ),

                    _buildFactCard(
                      'Exploring online art communities can inspire creativity and reduce feelings of isolation.',
                      Colors.blue,
                    ),

                    _buildFactCard(
                      'VR applications for relaxation and mindfulness can be beneficial for mental health.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'Understanding online security can reduce the fear of online harassment.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'Writing a private online journal can help individuals process their emotions.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'Proper ergonomics in digital workspaces can prevent physical and mental strain.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'Gradually increasing exposure to digital stressors can build resilience.',
                      Colors.red,
                    ),

                    _buildFactCard(
                      'Setting boundaries and saying no to excessive digital demands is essential for well-being.',
                      Colors.teal,
                    ),

                    _buildFactCard(
                      'Rewarding oneself for digital discipline can encourage healthy habits.',
                      Colors.cyan,
                    ),

                    _buildFactCard(
                      'Curating a digital space with meaningful content can enhance one\'s online experience.',
                      Colors.deepOrange,
                    ),

                    _buildFactCard(
                      'Recognizing when digital stressors are overwhelming and seeking help from a mental health professional is crucial for well-being in the digital age.',
                      Colors.indigo,
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 18 / 9,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Do you know ?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 0.9 * MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: [
                    _buildFactCard(
                      'The world\'s oldest known patent document, granted in 500 BCE, was discovered in Syria and protected a method of making purple dye.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'In 1971, the U.S. patent office issued a patent for a "Method of Exercising a Cat," which involved using a laser pointer to entertain felines.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'The concept of IP protection was advocated by Thomas Jefferson, who believed that inventors should have exclusive rights to their creations.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'In 2014, a man tried to trademark the word "react" and was met with backlash from the YouTube community, leading to a change in trademark policy.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'Trade secret protection was once referred to as "mystery of manufacture" and was rooted in medieval trade guilds.',
                      Colors.red,
                    ),

                    _buildFactCard(
                      'The shape of the Coca-Cola bottle was granted trademark protection in 1977.',
                      Colors.teal,
                    ),

                    _buildFactCard(
                      'The creator of the board game Monopoly originally patented it in 1904 as "The Landlord\'s Game."',
                      Colors.cyan,
                    ),

                    _buildFactCard(
                      'The perfume industry relies heavily on trade secret protection for their fragrance formulas.',
                      Colors.deepOrange,
                    ),

                    _buildFactCard(
                      'The WIPO Copyright Treaty, adopted in 1996, extended copyright protection to digital works and the internet.',
                      Colors.indigo,
                    ),

                    _buildFactCard(
                      'The U.S. Copyright Office received over 512,000 copyright registrations in 2020.',
                      Colors.blue,
                    ),

                    _buildFactCard(
                      'The "patent thicket" phenomenon refers to a dense web of overlapping patents that can hinder innovation.',
                      Colors.green,
                    ),

                    _buildFactCard(
                      'The "Patent Cliff" refers to the loss of patent protection for multiple blockbuster drugs, leading to a surge in generic versions.',
                      Colors.orange,
                    ),

                    _buildFactCard(
                      'The concept of "patent exhaustion" allows the buyer of a patented product to use or resell it without further restrictions from the patent holder.',
                      Colors.purple,
                    ),

                    _buildFactCard(
                      'Some countries have "fair dealing" or "fair use" exceptions to copyright law that allow limited use without permission for purposes like research or criticism.',
                      Colors.brown,
                    ),

                    _buildFactCard(
                      'In 2018, a selfie-snapping monkey named Naruto became the center of a copyright dispute over who owned the rights to the photos.',
                      Colors.red,
                    ),
                    _buildFactCard(
                      'The first recorded copyright law was enacted in 1710 in the United Kingdom, known as the Statute of Anne.',
                      Colors.blue,
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 18 / 9,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 0.4 * MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.brown],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MusicPlayerScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.library_music, // This is the book icon
                              color: Colors.white,
                              size: 40, // Adjust the size as needed
                            ),
                            SizedBox(width: 8), // Add some spacing between the icon and text
                            Text(
                              '  Relax \nYourself',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 0.4 * MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.brown], // Change the gradient colors to pink and brown
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserDashboard()),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.lightbulb, // This is the book icon
                              color: Colors.white,
                              size: 40, // Adjust the size as needed
                            ),
                            SizedBox(width: 8), // Add some spacing between the icon and text
                            Text(
                              '  Mind \nGames',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 0.9 * MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade600, Colors.purpleAccent, Colors.purple.shade600], // Change the gradient colors to pink and brown
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SuggestionPage()),
                        );
                      },
                      child: Container(
                        child: Text(
                          '  Contact US',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SuggestionPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(128.0),
                        ),
                        width: 100.0, // Make it square
                        height: 100.0, // Make it square
                        child: Icon(
                          Icons.help_outline, // Use the FAQ icon or any other icon you prefer
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
            ]
        ),
      ),
    );
  }
}
Widget _buildFactCard(String text, Color backgroundColor) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}
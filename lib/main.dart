import 'package:destiny_challenge/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();
void main() {
  runApp(const Destiny());
}

class Destiny extends StatelessWidget {
  const Destiny({super.key});

  @override
  Widget build(BuildContext context) {
    return const StoryPage();
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

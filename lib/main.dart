import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final links = [
      Link('Resume', 'https://resume.io/'),
      Link('GitHub', 'https://github.com/'),
      Link('LinkedIn', 'https://www.linkedin.com/'),
    ];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haris Samingan'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/LnFqnFs/profilepic2.png',
              ),
              radius: 48,
            ),
            SizedBox(height: 20),
            const Text('I code, climb and conquer.'),
            SizedBox(height: 10),
            for (final link in links)
              SizedBox(
                width: width * .9,
                child: OutlinedButton(
                  child: Text(link.text),
                  onPressed: () => launch(link.url),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Link {
  final String text;
  final String url;

  Link(this.text, this.url);
}

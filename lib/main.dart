import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinksLandingPage(),
    );
  }
}

List socialLinks = [
  {'text': 'Udemy', 'url': 'https://www.udemy.com'},
  {'text': 'LinkedIn', 'url': 'https://www.linkedin.com'},
  {'text': 'Facebook', 'url': 'https://www.facebook.com'},
];

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35),
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/LnFqnFs/profilepic2.png',
              ),
              radius: 48,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '@haris.samingan',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            for (final data in socialLinks)
              ButtonLink(text: data['text'], url: data['url']),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Built in Flutter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
                SizedBox(width: 8),
                Image.network(
                  'https://www.neappoli.com/static/media/flutterImg.94b8139a.png',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0).add(
        EdgeInsets.symmetric(horizontal: 10),
      ),
      child: SizedBox(
        width: width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Color.fromRGBO(57, 224, 155, 1),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(text, style: TextStyle(fontSize: 16)),
          onPressed: () => launch(url),
        ),
      ),
    );
  }
}

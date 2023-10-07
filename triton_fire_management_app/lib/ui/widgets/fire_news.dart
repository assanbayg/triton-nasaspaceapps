import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FireNews extends StatefulWidget {
  const FireNews({super.key});

  @override
  State<FireNews> createState() => _FireNewsState();
}

class _FireNewsState extends State<FireNews> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 4,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              final uri = Uri.parse("https://flutter.io");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {}
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // it will hold image later
                  Container(
                    height: 100,
                    width: 20,
                    color: Colors.red,
                  ),
                  // it will hold news title
                  Container(
                    width: 120,
                    child: Center(
                      child: Text('Bad News'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

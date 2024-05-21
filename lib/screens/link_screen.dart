import 'package:flutter/material.dart';
import 'package:presentation_app/data/lesson_model.dart';
import 'package:presentation_app/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkScreen extends StatefulWidget {
  final Link? link;
  const LinkScreen({super.key, this.link});

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.link!.src!))) {
      throw Exception('Could not launch ${widget.link!.src}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Text(
              "Click on Button to open link",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            ButtonWidget(
              title: "Forum",
              onTap: () {
                _launchUrl();
              },
            ),
          ],
        ));
  }
}

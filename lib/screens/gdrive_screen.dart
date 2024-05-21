import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation_app/data/lesson_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GDriveScreen extends StatelessWidget {
  final Gdrive? gdrive;
  const GDriveScreen({super.key, this.gdrive});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(gdrive!.url!))) {
      throw Exception('Could not launch ${gdrive!.url}');
    }
  }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gdrive!.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: (){
                _launchUrl();
              },
              child: Text(
                gdrive!.url!,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                  decorationColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: gdrive!.thumbnail!,
          ),
        )
      ],
    );
  }
}

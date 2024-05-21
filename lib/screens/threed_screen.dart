import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation_app/data/lesson_model.dart';

class ThreedScreen extends StatelessWidget {
  final Threed? threed;
  const ThreedScreen({super.key, this.threed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          threed!.name!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          threed!.category!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            imageUrl: threed!.url!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
              color: Theme.of(context).primaryColor,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        if (threed!.labels!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Tags",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 40,
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: threed!.labels!.length,
                    itemBuilder: (context, index) {
                      return threed!.labels![index].isNotEmpty
                          ? Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                threed!.labels![index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: const Text("No Tags"),
                            );
                    },
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}

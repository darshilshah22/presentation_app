import 'package:flutter/material.dart';
import 'package:presentation_app/widgets/button.dart';

class QuestionScreen extends StatefulWidget {
  final String? question;
  final String? answer;
  final bool? isOption;
  final bool? isHide;
  final VoidCallback? onTap;
  final List<String>? options;
  const QuestionScreen(
      {super.key,
      this.question,
      this.answer,
      this.isOption,
      this.isHide,
      this.onTap,
      this.options});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int optionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Question: ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          widget.question!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        if (widget.isOption! && widget.options != null)
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.options!.length,
            itemBuilder: (context, index) {
              return InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  setState(() {
                    optionIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Icon(index == optionIndex ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded),
                      const SizedBox(width: 4),
                      Text(widget.options![index], style: const TextStyle(fontSize: 16),)
                    ],
                  ),
                ),
              );
            },
          ),
        const SizedBox(height: 16),
        ButtonWidget(
            title: widget.isHide! ? "Hide Answer" : "Show Answer",
            onTap: widget.onTap!),
        if (widget.isHide!)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 6),
            child: Text(
              "Answer: ${widget.answer!}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
      ],
    );
  }
}

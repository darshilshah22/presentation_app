import 'package:flutter/material.dart';
import 'package:presentation_app/bloc/lesson_bloc.dart';
import 'package:presentation_app/constants/strings.dart';
import 'package:presentation_app/data/api_service.dart';

import '../constants/constants.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  LessonBloc lessonBloc = LessonBloc();

  @override
  void initState() {
    lessonBloc.add(GetLessonData(lessonId: 33));
    super.initState();
  }

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(presentationApp),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _previousPage,
              child: Text(previous),
            ),
            ElevatedButton(
              onPressed: _nextPage,
              child: Text(next),
            ),
          ],
        ),
      ),
    );
  }
}

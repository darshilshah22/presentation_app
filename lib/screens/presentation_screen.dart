import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation_app/bloc/lesson_bloc.dart';
import 'package:presentation_app/constants/strings.dart';
import 'package:presentation_app/providers/lesson_provider.dart';
import 'package:presentation_app/screens/gdrive_screen.dart';
import 'package:presentation_app/screens/image_screen.dart';
import 'package:presentation_app/screens/link_screen.dart';
import 'package:presentation_app/screens/question_screen.dart';
import 'package:presentation_app/screens/threed_screen.dart';
import 'package:presentation_app/screens/youtube_video.dart';
import 'package:presentation_app/widgets/button.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  LessonBloc lessonBloc = LessonBloc();
  bool mcqAnswerShow = false;
  bool fibAnswerShow = false;
  bool tfAnswerShow = false;
  bool owaAnswerShow = false;

  @override
  void initState() {
    lessonBloc.add(GetLessonData(lessonId: 33));
    super.initState();
  }

  void _nextPage(int currentPage) {
    if (currentPage < lessonTypes.length - 1) {
      currentPage++;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage(int currentPage) {
    if (currentPage > 0) {
      currentPage--;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LessonProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E6E6),
        title: Text(lessonTypes[provider.pageIndex]),
      ),
      body: BlocConsumer<LessonBloc, LessonState>(
        bloc: lessonBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetLessonDataSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32, left: 16, right: 16, bottom: 24),
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.lessonList!.length,
                  itemBuilder: (context, index) {
                    switch (state.lessonList![provider.pageIndex].ltype) {
                      case 'image':
                        return ImageScreen(
                          image: state.lessonList![provider.pageIndex].imageUrl,
                        );
                      case 'youtube':
                        return YoutubeVideoScreen(
                          youtubeVideo: state.lessonList![provider.pageIndex],
                        );
                      case 'link':
                        return LinkScreen(
                          link: state.lessonList![provider.pageIndex],
                        );
                      case 'gdrive':
                        return GDriveScreen(
                          gdrive: state.lessonList![provider.pageIndex],
                        );
                      case 'threed':
                        return ThreedScreen(
                          threed: state.lessonList![provider.pageIndex],
                        );
                      case 'mcq':
                        return QuestionScreen(
                          question:
                              state.lessonList![provider.pageIndex].question,
                          answer: state.lessonList![provider.pageIndex].answer,
                          isOption: true,
                          options:
                              state.lessonList![provider.pageIndex].options,
                          isHide: mcqAnswerShow,
                          onTap: () {
                            setState(() {
                              mcqAnswerShow = !mcqAnswerShow;
                            });
                          },
                        );
                      case 'fib':
                        return QuestionScreen(
                          question: state
                              .lessonList![provider.pageIndex].questionForm,
                          answer: state.lessonList![provider.pageIndex].answer,
                          isOption: false,
                          isHide: fibAnswerShow,
                          onTap: () {
                            setState(() {
                              fibAnswerShow = !fibAnswerShow;
                            });
                          },
                        );
                      case 'tf':
                        return QuestionScreen(
                          question:
                              state.lessonList![provider.pageIndex].question,
                          answer: state.lessonList![provider.pageIndex].answer,
                          isOption: true,
                          options:
                              state.lessonList![provider.pageIndex].options,
                          isHide: tfAnswerShow,
                          onTap: () {
                            setState(() {
                              tfAnswerShow = !tfAnswerShow;
                            });
                          },
                        );
                      case 'owa':
                        return QuestionScreen(
                          question:
                              state.lessonList![provider.pageIndex].question,
                          answer: state.lessonList![provider.pageIndex].answer,
                          isOption: false,
                          isHide: owaAnswerShow,
                          onTap: () {
                            setState(() {
                              owaAnswerShow = !owaAnswerShow;
                            });
                          },
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                  onPageChanged: (index) {
                    Provider.of<LessonProvider>(context, listen: false)
                        .setPageIndex(index);
                  },
                ),
              ),
            );
          } else if (state is GetLessonDataLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              onTap: () {
                _previousPage(provider.pageIndex);
              },
              title: previous,
            ),
            Text(
              "${provider.pageIndex + 1} / ${lessonTypes.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ButtonWidget(
              onTap: () {
                _nextPage(provider.pageIndex);
              },
              title: next,
            ),
          ],
        ),
      ),
    );
  }
}

part of 'lesson_bloc.dart';

@immutable
sealed class LessonEvent {}

class GetLessonData extends LessonEvent{
  final int lessonId;

  GetLessonData({required this.lessonId});   
}
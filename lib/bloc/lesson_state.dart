part of 'lesson_bloc.dart';

@immutable
sealed class LessonState {}

final class LessonInitial extends LessonState {}

final class GetLessonDataLoading extends LessonState {}

final class GetLessonDataSuccess extends LessonState {
  final LessonModel? lessonModel;
  GetLessonDataSuccess({this.lessonModel});
}

final class GetLessonDataError extends LessonState {
  final String? error;
  GetLessonDataError({this.error});
}

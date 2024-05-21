import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:presentation_app/data/api_service.dart';
import 'package:presentation_app/data/lesson_model.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonInitial()) {
    on<GetLessonData>((event, emit) async {
      emit(GetLessonDataLoading());
      List<dynamic> lessonList = [];
      try {
        List<dynamic>? response = await fetchLessonPlanData(event.lessonId);

        lessonList.addAll(
          [
            ImageModel.fromJson(response![0]['image']),
            YoutubeVideo.fromJson(response[1]['YoutubeVideo']),
            Link.fromJson(response[2]['link']),
            Gdrive.fromJson(response[3]['gdrive']),
            Threed.fromJson(response[4]['threed']),
            Threed.fromJson(response[5]['threed']),
            Threed.fromJson(response[6]['threed']),
            Mcq.fromJson(response[7]['mcq']),
            Fib.fromJson(response[8]['fib']),
            Tf.fromJson(response[9]['tf']),
            Owa.fromJson(response[10]['owa'])
          ],
        );

        log(lessonList[1].toJson().toString());
        emit(GetLessonDataSuccess(lessonList: lessonList));
      } catch (e) {
        log(e.toString());
        emit(GetLessonDataError(error: e.toString()));
      }
    });
  }
}

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
      List<Threed> threeds = [];
      try {
        List<dynamic>? response = await fetchLessonPlanData(event.lessonId);

        ImageModel imageModel = ImageModel.fromJson(response![0]['image']);
        YoutubeVideo youtubeVideo =
            YoutubeVideo.fromJson(response[1]['YoutubeVideo']);
        Link link = Link.fromJson(response[2]['link']);
        Gdrive gdrive = Gdrive.fromJson(response[3]['gdrive']);
        Threed threed = Threed.fromJson(response[4]['threed']);
        Threed threed1 = Threed.fromJson(response[5]['threed']);
        Threed threed2 = Threed.fromJson(response[6]['threed']);
        Mcq mcq = Mcq.fromJson(response[7]['mcq']);
        Fib fib = Fib.fromJson(response[8]['fib']);
        Tf tf = Tf.fromJson(response[9]['tf']);
        Owa owa = Owa.fromJson(response[10]['owa']);
        threeds.addAll([threed, threed1, threed2]);

        LessonModel lessonModel = LessonModel(
          image: imageModel,
          youtubeVideo: youtubeVideo,
          link: link,
          gdrive: gdrive,
          threeds: threeds,
          mcq: mcq,
          fib: fib,
          tf: tf,
          owa: owa,
        );
        log(lessonModel.toJson().toString());
      } catch (e) {
        log(e.toString());
        emit(GetLessonDataError(error: e.toString()));
      }
    });
  }
}

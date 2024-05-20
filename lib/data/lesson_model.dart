class LessonData {
  List<LessonModel>? data;

  LessonData({this.data});

  LessonData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LessonModel>[];
      json['data'].forEach((v) {
        data!.add(LessonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LessonModel {
  ImageModel? image;
  YoutubeVideo? youtubeVideo;
  Link? link;
  Gdrive? gdrive;
  List<Threed>? threeds;
  Mcq? mcq;
  Fib? fib;
  Tf? tf;
  Owa? owa;

  LessonModel(
      {this.image,
      this.youtubeVideo,
      this.link,
      this.gdrive,
      this.threeds,
      this.mcq,
      this.fib,
      this.tf,
      this.owa});

  LessonModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    youtubeVideo = json['YoutubeVideo'] != null
        ? YoutubeVideo.fromJson(json['YoutubeVideo'])
        : null;
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
    gdrive = json['gdrive'] != null ? Gdrive.fromJson(json['gdrive']) : null;
    if (json['threeds'] != null) {
      threeds = <Threed>[];
      json['data'].forEach((v) {
        threeds!.add(Threed.fromJson(v));
      });
    }
    mcq = json['mcq'] != null ? Mcq.fromJson(json['mcq']) : null;
    fib = json['fib'] != null ? Fib.fromJson(json['fib']) : null;
    tf = json['tf'] != null ? Tf.fromJson(json['tf']) : null;
    owa = json['owa'] != null ? Owa.fromJson(json['owa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (youtubeVideo != null) {
      data['YoutubeVideo'] = youtubeVideo!.toJson();
    }
    if (link != null) {
      data['link'] = link!.toJson();
    }
    if (gdrive != null) {
      data['gdrive'] = gdrive!.toJson();
    }
    if (threeds != null) {
      data['threeds'] = threeds!.map((v) => v.toJson()).toList();
    }
    if (mcq != null) {
      data['mcq'] = mcq!.toJson();
    }
    if (fib != null) {
      data['fib'] = fib!.toJson();
    }
    if (tf != null) {
      data['tf'] = tf!.toJson();
    }
    if (owa != null) {
      data['owa'] = owa!.toJson();
    }
    return data;
  }
}

class ImageModel {
  String? imageUrl;

  ImageModel({this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    return data;
  }
}

class YoutubeVideo {
  String? name;
  String? thumbnail;
  String? videoUrl;
  String? embedUrl;

  YoutubeVideo({this.name, this.thumbnail, this.videoUrl, this.embedUrl});

  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    embedUrl = json['embed_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['video_url'] = videoUrl;
    data['embed_url'] = embedUrl;
    return data;
  }
}

class Link {
  String? src;

  Link({this.src});

  Link.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['src'] = src;
    return data;
  }
}

class Gdrive {
  String? name;
  String? embedUrl;
  String? thumbnail;
  String? type;
  String? url;

  Gdrive({this.name, this.embedUrl, this.thumbnail, this.type, this.url});

  Gdrive.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    embedUrl = json['embedUrl'];
    thumbnail = json['thumbnail'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['embedUrl'] = embedUrl;
    data['thumbnail'] = thumbnail;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class Threed {
  String? name;
  String? id;
  String? category;
  int? modelid;
  String? url;
  List<String>? labels;

  Threed(
      {this.name, this.id, this.category, this.modelid, this.url, this.labels});

  Threed.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    category = json['category'];
    modelid = json['modelid'];
    url = json['url'];
    labels = json['labels'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['category'] = category;
    data['modelid'] = modelid;
    data['url'] = url;
    data['labels'] = labels;
    return data;
  }
}

class Mcq {
  List<String>? options;
  String? mcqType;
  String? question;
  String? answer;
  String? questionUrl;

  Mcq(
      {this.options,
      this.mcqType,
      this.question,
      this.answer,
      this.questionUrl});

  Mcq.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    mcqType = json['mcq_type'];
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['options'] = options;
    data['mcq_type'] = mcqType;
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    return data;
  }
}

class Fib {
  String? question;
  String? answer;
  String? questionForm;
  String? answerIndex;

  Fib({this.question, this.answer, this.questionForm, this.answerIndex});

  Fib.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    questionForm = json['question_form'];
    answerIndex = json['answer_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['question_form'] = questionForm;
    data['answer_index'] = answerIndex;
    return data;
  }
}

class Tf {
  List<String>? options;
  String? question;
  String? answer;
  String? questionUrl;

  Tf({this.options, this.question, this.answer, this.questionUrl});

  Tf.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['options'] = options;
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    return data;
  }
}

class Owa {
  String? question;
  String? answer;
  String? questionUrl;

  Owa({this.question, this.answer, this.questionUrl});

  Owa.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    return data;
  }
}

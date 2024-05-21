class ImageModel {
  String? imageUrl;
  String? ltype;

  ImageModel({this.imageUrl, this.ltype});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    ltype = json['ltype'] ?? "image";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['ltype'] = ltype ?? "image";
    return data;
  }
}

class YoutubeVideo {
  String? name;
  String? thumbnail;
  String? videoUrl;
  String? embedUrl;
  String? ltype;

  YoutubeVideo(
      {this.name, this.thumbnail, this.videoUrl, this.embedUrl, this.ltype});

  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    embedUrl = json['embed_url'];
    ltype = json['ltype'] ?? "youtube";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['video_url'] = videoUrl;
    data['embed_url'] = embedUrl;
    data['ltype'] = ltype ?? "youtube";
    return data;
  }
}

class Link {
  String? src;
  String? ltype;

  Link({this.src, this.ltype});

  Link.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    ltype = json['ltype'] ?? "link";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['src'] = src;
    data['ltype'] = ltype ?? "link";
    return data;
  }
}

class Gdrive {
  String? name;
  String? embedUrl;
  String? thumbnail;
  String? type;
  String? url;
  String? ltype;

  Gdrive(
      {this.name,
      this.embedUrl,
      this.thumbnail,
      this.type,
      this.url,
      this.ltype});

  Gdrive.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    embedUrl = json['embedUrl'];
    thumbnail = json['thumbnail'];
    type = json['type'];
    url = json['url'];
    ltype = json['ltype'] ?? "gdrive";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['embedUrl'] = embedUrl;
    data['thumbnail'] = thumbnail;
    data['type'] = type;
    data['url'] = url;
    data['ltype'] = ltype ?? "gdrive";
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
  String? ltype;

  Threed(
      {this.name,
      this.id,
      this.category,
      this.modelid,
      this.url,
      this.labels,
      this.ltype});

  Threed.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    category = json['category'];
    modelid = json['modelid'];
    url = json['url'];
    labels = json['labels'].cast<String>();
    ltype = json['ltype'] ?? "threed";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['category'] = category;
    data['modelid'] = modelid;
    data['url'] = url;
    data['labels'] = labels;
    data['ltype'] = ltype ?? "threed";
    return data;
  }
}

class Mcq {
  List<String>? options;
  String? mcqType;
  String? question;
  String? answer;
  String? questionUrl;
  String? ltype;

  Mcq(
      {this.options,
      this.mcqType,
      this.question,
      this.answer,
      this.questionUrl,
      this.ltype});

  Mcq.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    mcqType = json['mcq_type'];
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
    ltype = json['ltype'] ?? "mcq";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['options'] = options;
    data['mcq_type'] = mcqType;
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    data['ltype'] = ltype ?? "mcq";
    return data;
  }
}

class Fib {
  String? question;
  String? answer;
  String? questionForm;
  String? answerIndex;
  String? ltype;

  Fib(
      {this.question,
      this.answer,
      this.questionForm,
      this.answerIndex,
      this.ltype});

  Fib.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    questionForm = json['question_form'];
    answerIndex = json['answer_index'];
    ltype = json['ltype'] ?? "fib";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['question_form'] = questionForm;
    data['answer_index'] = answerIndex;
    data['ltype'] = ltype ?? "fib";
    return data;
  }
}

class Tf {
  List<String>? options;
  String? question;
  String? answer;
  String? questionUrl;
  String? ltype;

  Tf({this.options, this.question, this.answer, this.questionUrl, this.ltype});

  Tf.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
    ltype = json['ltype'] ?? "tf";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['options'] = options;
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    data['ltype'] = ltype ?? "tf";
    return data;
  }
}

class Owa {
  String? question;
  String? answer;
  String? questionUrl;
  String? ltype;

  Owa({this.question, this.answer, this.questionUrl, this.ltype});

  Owa.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    questionUrl = json['question_url'];
    ltype = json['ltype'] ?? "owa";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['question_url'] = questionUrl;
    data['ltype'] = ltype ?? "owa";
    return data;
  }
}

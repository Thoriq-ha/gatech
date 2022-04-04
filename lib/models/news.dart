class News {
  News({
    required this.title,
    required this.thumb,
    required this.author,
    required this.tag,
    required this.time,
    required this.desc,
    required this.key,
  });
  late final String title;
  late final String thumb;
  late final String author;
  late final String tag;
  late final String time;
  late final String desc;
  late final String key;

  News.fromJson(Map<String, dynamic> json){
    title = json['title'].toString();
    thumb = json['thumb'].toString();
    author = json['author'].toString();
    tag = json['tag'].toString();
    time = json['time'].toString();
    desc = json['desc'].toString();
    key = json['key'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['thumb'] = thumb;
    _data['author'] = author;
    _data['tag'] = tag;
    _data['time'] = time;
    _data['desc'] = desc;
    _data['key'] = key;
    return _data;
  }
}
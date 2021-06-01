class Data {
  String? type;
  String? data;

  Data(this.type, this.data);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        json['type'],
        json['data'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': this.type,
        'data': this.data,
      };

  @override
  String toString() {
    return '''{"type": "${this.type}", "data": "${this.data}"}''';
  }
}

class Notification {
  String title;
  String body;

  Notification(
    this.title,
    this.body,
  );

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        json['title'] as String,
        json['body'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': this.title,
        'body': this.body,
      };

  @override
  String toString() {
    return 'Notification{title: $title, body: $body}';
  }
}

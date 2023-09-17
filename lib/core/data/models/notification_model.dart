class NotificationModel {
  String? title;
  String? text;
  String? notificatioNType;
  String? model;

  NotificationModel({this.title, this.text, this.notificatioNType, this.model});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    notificatioNType = json['notification_type'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    data['notification_type'] = this.notificatioNType;
    data['model'] = this.model;
    return data;
  }
}

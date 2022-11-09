class WildThingModel {
  double? x;
  double? y;
  String? type;

  WildThingModel({this.x, this.y, this.type});

  WildThingModel.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['type'] = this.type;
    return data;
  }
}

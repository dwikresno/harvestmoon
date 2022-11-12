class WildThingModel {
  double? x;
  double? y;
  String? type;
  int indicator = 1;

  WildThingModel({this.x, this.y, this.type, required this.indicator});

  WildThingModel.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    type = json['type'];
    indicator = json['indicator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['type'] = this.type;
    data['indicator'] = this.indicator;
    return data;
  }
}

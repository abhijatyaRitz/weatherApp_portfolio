///<summary>Major Weather class : Sunny/Rainy with icon and description
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  ///<summary>FROM Json string => TO Weather object
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int?,
      main: json['main'],
      description: json['description'],
      icon: json['icon']);

  ///<summary>FROM Weather object => TO Json string
  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

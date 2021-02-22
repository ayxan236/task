class JsonModel {
  int id;
  String title;
  String createdAt;
  bool isSelected;

  JsonModel({this.id, this.title, this.createdAt,this.isSelected});

  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(
      id: json['id'],
      title: json['title'],
      createdAt: json['createdAt'],
      isSelected : false,
    );
  }
}

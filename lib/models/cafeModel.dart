
class CafeModel  {
  String? title;
  String? description;

  String? image;
  int? id;

  CafeModel(
      {this.title, this.description,  this.image, this.id});

  CafeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;

    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
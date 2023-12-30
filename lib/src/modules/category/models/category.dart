import 'dart:io';

class Category {
  int? id;
  String? name;
  String? img;
  File? imageFile;
  int? status;

  Category({this.id, this.name, this.img, this.status});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['status'] = this.status;
    return data;
  }
}

class Unit {
  int? id;
  String? name;
  String? code;
  int? status;
  String? createdAt;

  Unit({this.id, this.name, this.code, this.status, this.createdAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

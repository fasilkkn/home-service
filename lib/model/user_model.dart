class UserModel {
  int? id;
  String? name;
  String? status;
  String? message;

  UserModel({this.id, this.name, this.status, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

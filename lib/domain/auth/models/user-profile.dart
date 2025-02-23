import 'package:vetomymobile/domain/auth/models/rol.dart';

class UserProfile {
  int? id;
  String? name;
  String? lastName;
  String? mail;
  Rol? rol;

  UserProfile({this.id, this.name, this.lastName, this.mail, this.rol});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    mail = json['mail'];
    rol = json['rol'] != null ? new Rol.fromJson(json['rol']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['mail'] = this.mail;
    if (this.rol != null) {
      data['rol'] = this.rol!.toJson();
    }
    return data;
  }
}

// uid, email, displayName, photoURL

import 'dart:developer';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? displayName;
  @HiveField(3)
  String? photoURL;
  @HiveField(4)
  String? phoneNumber;

  UserModel(
      {this.uid,
      this.email,
      this.displayName,
      this.photoURL,
      this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    displayName = json['displayName'];
    photoURL = json['photoURL'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['displayName'] = displayName;
    data['photoURL'] = photoURL;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

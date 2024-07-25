class UserModel {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  UserModel({this.uid, this.email, this.displayName, this.photoURL});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        uid: data['uid'],
        email: data['email'],
        displayName: data['displayName'],
        photoURL: data['photoURL']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL
    };
  }
}

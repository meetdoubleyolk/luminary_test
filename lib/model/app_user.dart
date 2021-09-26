import 'dart:convert';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

AppUser userFromJson(String str) {
  final jsonData = json.decode(str);
  return AppUser.fromJson(jsonData);
}

String userToJson(AppUser data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AppUser {
  String userId;
  String name;
  String email;
  String photoUrl;
  Timestamp? createdAt;
  Timestamp? dob;
  String shortBio;
  String country;
  String education;
  String university;
  String shortDescription;
  List<String>? languages;

  AppUser(
      {this.userId = "",
      this.name = "",
      this.email = "",
      this.photoUrl = "",
      this.createdAt,
      this.dob,
      this.shortBio = "",
      this.country = "",
      this.education = "",
      this.university = "",
      this.shortDescription = "",
      this.languages});

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        userId: json["id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        photoUrl: json["profile_pic_url"] ?? "",
        createdAt: json["join_date"] ?? "",
        dob: json["dob"] ?? "",
        shortBio: json["bio"] ?? "",
        country: json["country"] ?? "",
        education: json["education"] ?? "",
        university: json["university"] ?? "",
        shortDescription: json["short_description"] ?? "",
        languages: List.from(json['languages']),
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "name": name,
        "email": email,
        "profile_pic_url": photoUrl,
        "join_date": createdAt,
        "dob": dob,
        "bio": shortBio,
        "country": country,
        "education": education,
        "university": university,
        "short_description": shortDescription,
        "languages": languages
      };

  factory AppUser.fromDocument(Map<String, dynamic>? data) {
    return AppUser.fromJson(data!);
  }
}

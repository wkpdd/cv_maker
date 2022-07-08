// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  String? about;
  ProfileModel({
    this.about,
  });

  ProfileModel copyWith({
    String? about,
  }) {
    return ProfileModel(
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'about': about,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      about: map['about'] != null ? map['about'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileModel(about: $about)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel && other.about == about;
  }

  @override
  int get hashCode => about.hashCode;
}

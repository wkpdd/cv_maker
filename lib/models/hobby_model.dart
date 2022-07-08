// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HobbyModel {
  String? hobby;
  HobbyModel({
    this.hobby,
  });

  HobbyModel copyWith({
    String? hobby,
  }) {
    return HobbyModel(
      hobby: hobby ?? this.hobby,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hobby': hobby,
    };
  }

  factory HobbyModel.fromMap(Map<String, dynamic> map) {
    return HobbyModel(
      hobby: map['hobby'] != null ? map['hobby'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HobbyModel.fromJson(String source) => HobbyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HobbyModel(hobby: $hobby)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HobbyModel && other.hobby == hobby;
  }

  @override
  int get hashCode => hobby.hashCode;
}

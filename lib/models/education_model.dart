// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EducationModel {
  int? from;
  int? to;
  String? degree;
  String? university;
  EducationModel({
    this.from,
    this.to,
    this.degree,
    this.university,
  });

  EducationModel copyWith({
    int? from,
    int? to,
    String? degree,
    String? university,
  }) {
    return EducationModel(
      from: from ?? this.from,
      to: to ?? this.to,
      degree: degree ?? this.degree,
      university: university ?? this.university,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'degree': degree,
      'university': university,
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      from: map['from'] != null ? map['from'] as int : null,
      to: map['to'] != null ? map['to'] as int : null,
      degree: map['degree'] != null ? map['degree'] as String : null,
      university: map['university'] != null ? map['university'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationModel.fromJson(String source) => EducationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EducationModel(from: $from, to: $to, degree: $degree, university: $university)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EducationModel && other.from == from && other.to == to && other.degree == degree && other.university == university;
  }

  @override
  int get hashCode {
    return from.hashCode ^ to.hashCode ^ degree.hashCode ^ university.hashCode;
  }
}

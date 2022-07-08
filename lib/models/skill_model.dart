// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SkillModel {
  String? skill;
  double? howGood;
  SkillModel({
    this.skill,
    this.howGood,
  });

  SkillModel copyWith({
    String? skill,
    double? howGood,
  }) {
    return SkillModel(
      skill: skill ?? this.skill,
      howGood: howGood ?? this.howGood,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'skill': skill,
      'howGood': howGood,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      skill: map['skill'] != null ? map['skill'] as String : null,
      howGood: map['howGood'] != null ? map['howGood'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) => SkillModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SkillModel(skill: $skill, howGood: $howGood)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkillModel && other.skill == skill && other.howGood == howGood;
  }

  @override
  int get hashCode => skill.hashCode ^ howGood.hashCode;
}

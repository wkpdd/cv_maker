// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WorkExperiance {
  DateTime? from;
  DateTime? to;
  String? jobTitle;
  String? companeyName;
  String? experiance;
  WorkExperiance({
    this.from,
    this.to,
    this.jobTitle,
    this.companeyName,
    this.experiance,
  });

  WorkExperiance copyWith({
    DateTime? from,
    DateTime? to,
    String? jobTitle,
    String? companeyName,
    String? experiance,
  }) {
    return WorkExperiance(
      from: from ?? this.from,
      to: to ?? this.to,
      jobTitle: jobTitle ?? this.jobTitle,
      companeyName: companeyName ?? this.companeyName,
      experiance: experiance ?? this.experiance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from?.millisecondsSinceEpoch,
      'to': to?.millisecondsSinceEpoch,
      'jobTitle': jobTitle,
      'companeyName': companeyName,
      'experiance': experiance,
    };
  }

  factory WorkExperiance.fromMap(Map<String, dynamic> map) {
    return WorkExperiance(
      from: map['from'] != null ? DateTime.fromMillisecondsSinceEpoch(map['from'] as int) : null,
      to: map['to'] != null ? DateTime.fromMillisecondsSinceEpoch(map['to'] as int) : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      companeyName: map['companeyName'] != null ? map['companeyName'] as String : null,
      experiance: map['experiance'] != null ? map['experiance'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkExperiance.fromJson(String source) => WorkExperiance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorkExperiance(from: $from, to: $to, jobTitle: $jobTitle, companeyName: $companeyName, experiance: $experiance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkExperiance &&
        other.from == from &&
        other.to == to &&
        other.jobTitle == jobTitle &&
        other.companeyName == companeyName &&
        other.experiance == experiance;
  }

  @override
  int get hashCode {
    return from.hashCode ^ to.hashCode ^ jobTitle.hashCode ^ companeyName.hashCode ^ experiance.hashCode;
  }
}

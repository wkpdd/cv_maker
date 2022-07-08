// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Expertise {
  String? expertise;
  Expertise({
    this.expertise,
  });

  Expertise copyWith({
    String? expertise,
  }) {
    return Expertise(
      expertise: expertise ?? this.expertise,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expertise': expertise,
    };
  }

  factory Expertise.fromMap(Map<String, dynamic> map) {
    return Expertise(
      expertise: map['expertise'] != null ? map['expertise'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Expertise.fromJson(String source) => Expertise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Expertise(expertise: $expertise)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expertise && other.expertise == expertise;
  }

  @override
  int get hashCode => expertise.hashCode;
}

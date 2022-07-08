// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Language {
  String? language;
  String? comment;
  double? level;
  Language({
    this.language,
    this.comment,
    this.level,
  });

  Language copyWith({
    String? language,
    String? comment,
    double? level,
  }) {
    return Language(
      language: language ?? this.language,
      comment: comment ?? this.comment,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'comment': comment,
      'level': level,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      language: map['language'] != null ? map['language'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      level: map['level'] != null ? map['level'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Language(language: $language, comment: $comment, level: $level)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language && other.language == language && other.comment == comment && other.level == level;
  }

  @override
  int get hashCode => language.hashCode ^ comment.hashCode ^ level.hashCode;
}

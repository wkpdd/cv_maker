// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocialMedia {
  String? link;
  SocialMedia({
    this.link,
  });

  SocialMedia copyWith({
    String? link,
  }) {
    return SocialMedia(
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
    };
  }

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) => SocialMedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SocialMedia(link: $link)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialMedia && other.link == link;
  }

  @override
  int get hashCode => link.hashCode;
}

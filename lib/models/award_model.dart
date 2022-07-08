// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Award {
  DateTime? date;
  String? award;
  String? place;
  Award({
    this.date,
    this.award,
    this.place,
  });

  Award copyWith({
    DateTime? date,
    String? award,
    String? place,
  }) {
    return Award(
      date: date ?? this.date,
      award: award ?? this.award,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date?.millisecondsSinceEpoch,
      'award': award,
      'place': place,
    };
  }

  factory Award.fromMap(Map<String, dynamic> map) {
    return Award(
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
      award: map['award'] != null ? map['award'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Award.fromJson(String source) => Award.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Award(date: $date, award: $award, place: $place)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Award && other.date == date && other.award == award && other.place == place;
  }

  @override
  int get hashCode => date.hashCode ^ award.hashCode ^ place.hashCode;
}

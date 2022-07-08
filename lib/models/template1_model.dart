// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Template1_model {
  String phone;
  String firstname;
  String lastname;
  String city;
  Template1_model({
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.city,
  });

  Template1_model copyWith({
    String? phone,
    String? firstname,
    String? lastname,
    String? city,
  }) {
    return Template1_model(
      phone: phone ?? this.phone,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'city': city,
    };
  }

  factory Template1_model.fromMap(Map<String, dynamic> map) {
    return Template1_model(
      phone: map['phone'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template1_model.fromJson(String source) => Template1_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Template1_model(phone: $phone, firstname: $firstname, lastname: $lastname, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Template1_model && other.phone == phone && other.firstname == firstname && other.lastname == lastname && other.city == city;
  }

  @override
  int get hashCode {
    return phone.hashCode ^ firstname.hashCode ^ lastname.hashCode ^ city.hashCode;
  }
}

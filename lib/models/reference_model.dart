// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reference {
  String? fullname;
  String? jobtitle;
  String? companey;
  String? email;
  String? phone;
  String? address;
  Reference({
    this.fullname,
    this.jobtitle,
    this.companey,
    this.email,
    this.phone,
    this.address,
  });

  Reference copyWith({
    String? fullname,
    String? jobtitle,
    String? companey,
    String? email,
    String? phone,
    String? address,
  }) {
    return Reference(
      fullname: fullname ?? this.fullname,
      jobtitle: jobtitle ?? this.jobtitle,
      companey: companey ?? this.companey,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'jobtitle': jobtitle,
      'companey': companey,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory Reference.fromMap(Map<String, dynamic> map) {
    return Reference(
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      jobtitle: map['jobtitle'] != null ? map['jobtitle'] as String : null,
      companey: map['companey'] != null ? map['companey'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reference.fromJson(String source) => Reference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reference(fullname: $fullname, jobtitle: $jobtitle, companey: $companey, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reference &&
        other.fullname == fullname &&
        other.jobtitle == jobtitle &&
        other.companey == companey &&
        other.email == email &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^ jobtitle.hashCode ^ companey.hashCode ^ email.hashCode ^ phone.hashCode ^ address.hashCode;
  }
}

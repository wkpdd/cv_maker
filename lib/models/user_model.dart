// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String fname;
  String lname;
  String email;
  String address;
  String phone;
  String currentState;
  User({
    required this.fname,
    required this.lname,
    required this.email,
    required this.address,
    required this.phone,
    required this.currentState,
  });

  User copyWith({
    String? fname,
    String? lname,
    String? email,
    String? address,
    String? phone,
    String? currentState,
  }) {
    return User(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      currentState: currentState ?? this.currentState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fname': fname,
      'lname': lname,
      'email': email,
      'address': address,
      'phone': phone,
      'currentState': currentState,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fname: map['fname'] as String,
      lname: map['lname'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      currentState: map['currentState'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(fname: $fname, lname: $lname, email: $email, address: $address, phone: $phone, currentState: $currentState)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.fname == fname &&
        other.lname == lname &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.currentState == currentState;
  }

  @override
  int get hashCode {
    return fname.hashCode ^ lname.hashCode ^ email.hashCode ^ address.hashCode ^ phone.hashCode ^ currentState.hashCode;
  }
}

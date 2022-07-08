// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:cv_maker/models/expertise_model.dart';

class ExpertiseWidget {
  Expertise expertise;
  ExpertiseWidget({
    required this.expertise,
  });

  ExpertiseWidget copyWith({
    Expertise? expertise,
  }) {
    return ExpertiseWidget(
      expertise: expertise ?? this.expertise,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expertise': expertise.toMap(),
    };
  }

  factory ExpertiseWidget.fromMap(Map<String, dynamic> map) {
    return ExpertiseWidget(
      expertise: Expertise.fromMap(map['expertise'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpertiseWidget.fromJson(String source) => ExpertiseWidget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ExpertiseWidget(expertise: $expertise)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExpertiseWidget && other.expertise == expertise;
  }

  @override
  int get hashCode => expertise.hashCode;

  getWidget() {
    return pw.Container(
        child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
      pw.Container(
          height: 2,
          width: 2,
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(1),
            color: PdfColors.amber,
          )),
      pw.SizedBox(width: 3),
      pw.Text(expertise.expertise ?? " ", style: const pw.TextStyle(color: PdfColors.white))
    ]));
  }
}

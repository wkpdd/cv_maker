// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:cv_maker/models/education_model.dart';

class EducationModelWidget {
  EducationModel educationModel;
  EducationModelWidget({
    required this.educationModel,
  });

  EducationModelWidget copyWith({
    EducationModel? educationModel,
  }) {
    return EducationModelWidget(
      educationModel: educationModel ?? this.educationModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'educationModel': educationModel.toMap(),
    };
  }

  factory EducationModelWidget.fromMap(Map<String, dynamic> map) {
    return EducationModelWidget(
      educationModel: EducationModel.fromMap(map['educationModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationModelWidget.fromJson(String source) => EducationModelWidget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EducationModelWidget(educationModel: $educationModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EducationModelWidget && other.educationModel == educationModel;
  }

  @override
  int get hashCode => educationModel.hashCode;
// total height is 47
  getWidget() {
    return pw.Container(
        alignment: pw.Alignment.centerLeft,
        width: 50,
        child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
          pw.Stack(children: [
            pw.Container(
                width: 3,
                height: 47,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(2),
                  color: PdfColors.amberAccent,
                )),
            pw.Positioned(
              top: 18,
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  height: 3,
                  width: 3,
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(2),
                    color: PdfColors.amber,
                  )),
            )
          ]),
          pw.SizedBox(width: 2),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 5),
              pw.Text(
                  "${educationModel.from == null ? " " : educationModel.from.toString()} - ${educationModel.to == null ? " " : educationModel.to.toString()}",
                  style: const pw.TextStyle(color: PdfColors.white, fontSize: 10)),
              pw.Text(educationModel.degree ?? " ", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 12)),
              pw.Text(educationModel.university ?? " ", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 11)),
              pw.SizedBox(height: 5)
            ],
          ),
        ]));
  }
}

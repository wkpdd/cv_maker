// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cv_maker/models/skill_model.dart';

class SkillModelWidget {
  SkillModel skillModel;
  SkillModelWidget({
    required this.skillModel,
  });

  SkillModelWidget copyWith({
    SkillModel? skillModel,
  }) {
    return SkillModelWidget(
      skillModel: skillModel ?? this.skillModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'skillModel': skillModel.toMap(),
    };
  }

  factory SkillModelWidget.fromMap(Map<String, dynamic> map) {
    return SkillModelWidget(
      skillModel: SkillModel.fromMap(map['skillModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModelWidget.fromJson(String source) => SkillModelWidget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SkillModelWidget(skillModel: $skillModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkillModelWidget && other.skillModel == skillModel;
  }

  @override
  int get hashCode => skillModel.hashCode;
  // Total Height: 32 points

  getWidget() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 5),
        pw.Text(skillModel.skill ?? " ", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 14)),
        pw.Row(children: [
          pw.Container(
              width: skillModel.howGood,
              height: 4,
              decoration: const pw.BoxDecoration(
                color: PdfColors.amber,
                borderRadius: pw.BorderRadius.only(
                  topLeft: pw.Radius.circular(3),
                  bottomLeft: pw.Radius.circular(3),
                ),
              )),
          pw.Container(
              width: 100 - skillModel.howGood!,
              height: 4,
              decoration: const pw.BoxDecoration(
                color: PdfColors.grey,
                borderRadius: pw.BorderRadius.only(
                  topRight: pw.Radius.circular(3),
                  bottomRight: pw.Radius.circular(3),
                ),
              )),
        ]),
        pw.SizedBox(height: 5)
      ],
    );
  }
}

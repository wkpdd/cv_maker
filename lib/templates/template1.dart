import 'dart:io';
import 'dart:typed_data';

import 'package:cv_maker/models/award_model.dart';
import 'package:cv_maker/models/education_model.dart';
import 'package:cv_maker/models/expertise_model.dart';
import 'package:cv_maker/models/hobby_model.dart';
import 'package:cv_maker/models/language_model.dart';
import 'package:cv_maker/models/profile_model.dart';
import 'package:cv_maker/models/skill_model.dart';
import 'package:cv_maker/models/social_media_model.dart';
import 'package:cv_maker/models/template1_model.dart';
import 'package:cv_maker/models/user_model.dart';
import 'package:cv_maker/models/work_experiance.dart';
import 'package:cv_maker/pdf_widgets/template1/award_model_pdf_widget.dart';
import 'package:cv_maker/pdf_widgets/template1/education_model_pdf_widget.dart';
import 'package:cv_maker/pdf_widgets/template1/expertise_pdf_widget.dart';
import 'package:cv_maker/pdf_widgets/template1/skill_modell_pdf_widget.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class Template1 extends StatelessWidget {
  List<EducationModel> educations;
  List<SkillModel> skills;
  List<Award> awards;
  ProfileModel about;
  List<Expertise> expertises;
  List<WorkExperiance> workExp;
  List<SocialMedia> socialmedias;
  List<Language> languages;
  List<HobbyModel> hobbies;
  User user;
  Template1_model template1_model;
  pw.ImageProvider imageProvider;
  pw.ImageProvider icon;
  pw.ImageProvider skill;
  pw.ImageProvider phone;
  pw.ImageProvider location;
  pw.ImageProvider profile;
  pw.ImageProvider refrence;
  pw.ImageProvider workExperiance;
  pw.ImageProvider hobby;
  pw.ImageProvider referenceP;
  pw.ImageProvider mail;
  pw.ImageProvider award;
  pw.ImageProvider expertise;
  pw.ImageProvider language;
  Template1(
      {required this.template1_model,
      required this.skills,
      required this.skill,
      required this.user,
      required this.educations,
      required this.icon,
      required this.languages,
      required this.awards,
      required this.phone,
      required this.expertises,
      required this.socialmedias,
      required this.workExp,
      required this.award,
      required this.about,
      required this.profile,
      required this.workExperiance,
      required this.referenceP,
      required this.hobbies,
      required this.refrence,
      required this.hobby,
      required this.expertise,
      required this.location,
      required this.mail,
      required this.language,
      required this.imageProvider,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uint8List fontData = File('assets/fonts/Dancing_Script/static/DancingScript-Bold.ttf').readAsBytesSync();
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    final Uint8List fontData1 = File('assets/fonts/Finlandica/Finlandica-VariableFont_wght.ttf').readAsBytesSync();
    final ttf1 = pw.Font.ttf(fontData1.buffer.asByteData());

    _picture() {
      return pw.Container(
          height: 100,
          width: 100,
          child: pw.ClipRRect(
              horizontalRadius: 50,
              verticalRadius: 50,
              child: pw.Container(
                child: pw.Image(imageProvider, fit: pw.BoxFit.cover, width: 100, height: 100, dpi: 300),
              )));
    }

    List<pw.Widget> _educationModel() {
      return List.generate(educations.length, (int index) {
        return EducationModelWidget(educationModel: educations[index]).getWidget();
      });
    }

    List<pw.Widget> _awardModel() {
      return List.generate(awards.length, (int index) {
        return AwardModelWidget(educationModel: awards[index]).getWidget();
      });
    }

    _education() {
      return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  child: pw.Image(icon, fit: pw.BoxFit.cover, width: 35, height: 35, dpi: 300),
                  width: 30,
                  height: 30,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(10), boxShadow: const [pw.BoxShadow(color: PdfColors.white, offset: PdfPoint(3, 3))]))),
          pw.SizedBox(width: 10),
          pw.Expanded(
              flex: 3, child: pw.Text("Educations", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 16))),
        ]),
        pw.SizedBox(height: 10),
        ..._educationModel(),
        pw.SizedBox(height: 15),
      ]);
    }

    _awards() {
      return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  child: pw.Image(award, fit: pw.BoxFit.cover, width: 35, height: 35, dpi: 300),
                  width: 30,
                  height: 30,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(10), boxShadow: const [pw.BoxShadow(color: PdfColors.white, offset: PdfPoint(3, 3))]))),
          pw.SizedBox(width: 10),
          pw.Expanded(flex: 3, child: pw.Text("Awards", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 16))),
        ]),
        pw.SizedBox(height: 10),
        ..._awardModel(),
        pw.SizedBox(height: 15),
      ]);
    }

    _skillModel() {
      return List.generate(skills.length, (int index) {
        return SkillModelWidget(skillModel: skills[index]).getWidget();
      });
    }

    _languageModel() {
      return List.generate(languages.length, (int index) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(height: 5),
            pw.Text("${languages[index].language ?? " "} | ${languages[index].comment ?? " "}",
                style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 14)),
            pw.SizedBox(height: 2),
            pw.Row(children: [
              pw.Container(
                  width: languages[index].level,
                  height: 4,
                  decoration: const pw.BoxDecoration(
                    color: PdfColors.amber,
                    borderRadius: pw.BorderRadius.only(
                      topLeft: pw.Radius.circular(3),
                      bottomLeft: pw.Radius.circular(3),
                    ),
                  )),
              pw.Container(
                  width: 100 - languages[index].level!,
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
      });
    }

    _skills() {
      return pw.Column(children: [
        pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  child: pw.Image(skill, fit: pw.BoxFit.cover, width: 30, height: 30, dpi: 300),
                  width: 40,
                  height: 40,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(10), boxShadow: const [pw.BoxShadow(color: PdfColors.white, offset: PdfPoint(3, 3))]))),
          pw.SizedBox(width: 10),
          pw.Expanded(flex: 3, child: pw.Text("Skills", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 16))),
        ]),
        pw.SizedBox(height: 10),
        ..._skillModel(),
        pw.SizedBox(height: 15),
      ]);
    }

    _languages() {
      return pw.Column(children: [
        pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  child: pw.Image(language, fit: pw.BoxFit.cover, width: 30, height: 30, dpi: 300),
                  width: 40,
                  height: 40,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(10), boxShadow: const [pw.BoxShadow(color: PdfColors.white, offset: PdfPoint(3, 3))]))),
          pw.SizedBox(width: 10),
          pw.Expanded(
              flex: 3, child: pw.Text("Languages", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 16))),
        ]),
        pw.SizedBox(height: 10),
        ..._languageModel(),
        pw.SizedBox(height: 15),
      ]);
    }

    _leftSide() {
      //40 + 100 + 55
      return pw.Padding(
        padding: const pw.EdgeInsets.all(20.0),
        child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [_picture(), _education(), _skills(), _languages()]),
      );
    }

    _infop2() {
      return pw.Container(
        child: pw.Column(
          children: [
            pw.Text("${user.fname} ${user.lname}",
                style: pw.TextStyle(font: ttf, fontSize: 30, color: PdfColors.amber), textAlign: pw.TextAlign.left),
            pw.Text(user.currentState.toUpperCase(), style: const pw.TextStyle(fontSize: 12, letterSpacing: 2, color: PdfColors.white)),
            pw.SizedBox(height: 15),
            pw.Container(height: 1, width: 150, color: PdfColors.white)
          ],
        ),
      );
    }

    _expertisesLisr() {
      return List.generate(expertises.length, (index) => ExpertiseWidget(expertise: expertises[index]).getWidget());
    }

    _expertises() {
      return pw.Column(children: [
        pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  child: pw.Image(expertise, fit: pw.BoxFit.cover, width: 35, height: 35, dpi: 300),
                  width: 30,
                  height: 30,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(10), boxShadow: const [pw.BoxShadow(color: PdfColors.white, offset: PdfPoint(3, 3))]))),
          pw.SizedBox(width: 10),
          pw.Expanded(
              flex: 3, child: pw.Text("Expertises", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 16))),
        ]),
        pw.SizedBox(height: 10),
        ..._expertisesLisr()
      ]);
    }

    _leftSidep2() {
      //40 + 100 + 55
      return pw.Padding(
        padding: const pw.EdgeInsets.all(20.0),
        child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [_infop2(), _awards(), _expertises()]),
      );
    }

    _header() {
      return pw.Stack(children: [
        pw.Center(
            child: pw.Positioned(
          left: -15,
          child:
              pw.Container(width: 140, height: 140, decoration: pw.BoxDecoration(borderRadius: pw.BorderRadius.circular(70), color: PdfColors.amber)),
        )),
        pw.Positioned(
            top: 20,
            left: 25,
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.Text("${user.fname} ${user.lname}", style: pw.TextStyle(fontSize: 50, font: ttf, fontWeight: pw.FontWeight.bold)),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Container(
                    width: 60,
                    height: 2,
                    decoration: pw.BoxDecoration(color: PdfColor.fromHex("#2a2a2a"), borderRadius: pw.BorderRadius.circular(1))),
                pw.Text(user.currentState.toUpperCase(), style: const pw.TextStyle(fontSize: 12, letterSpacing: 2)),
                pw.Container(
                    width: 60,
                    height: 2,
                    decoration: pw.BoxDecoration(color: PdfColor.fromHex("#2a2a2a"), borderRadius: pw.BorderRadius.circular(1))),
              ])
            ])),
      ]);
    }

    // _headerBar() {
    //   return pw.Row(children: [
    //     pw.Container(width: 60, height: 3, decoration: pw.BoxDecoration(color: PdfColors.amber, borderRadius: pw.BorderRadius.circular(2))),
    //     pw.Text("Flutter Developper"),
    //     pw.Container(width: 60, height: 3, decoration: pw.BoxDecoration(color: PdfColors.amber, borderRadius: pw.BorderRadius.circular(2))),
    //   ]);
    // }

    _info() {
      return pw.Container(
          height: 60,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Container(width: 15, height: 50, color: PdfColors.amber),
              pw.Column(mainAxisAlignment: pw.MainAxisAlignment.center, crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                  pw.Row(children: [
                    pw.Image(phone, width: 20, height: 20),
                    pw.SizedBox(width: 3),
                    pw.Text(user.phone, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  ]),
                  pw.SizedBox(width: 10),
                  pw.Row(children: [
                    pw.Image(mail, width: 20, height: 20),
                    pw.SizedBox(width: 3),
                    pw.Text(user.email, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  ])
                ]),
                pw.SizedBox(height: 5),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
                  pw.Image(location, width: 20, height: 20),
                  pw.SizedBox(width: 3),
                  pw.Text(user.address, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ])
              ]),
              pw.Container(width: 15, height: 50, color: PdfColors.amber),
            ],
          ));
    }

    _profile() {
      return pw.Container(
          height: 220,
          child: pw.Row(children: [
            //leftSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.SizedBox(height: 10),
              pw.Image(profile, width: 30, height: 30),
              pw.SizedBox(height: 3),
              pw.Container(height: 150, width: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1))),
            ]),
            //rightSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.SizedBox(height: 10),
              pw.Container(
                height: 20,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
                  pw.Text("Profile", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Container(width: 100, height: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1)))
                ]),
              ),
              pw.Container(
                  height: 160,
                  width: 320,
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Text(
                      //800
                      about.about!,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.normal, font: ttf1, fontSize: 10),
                      textAlign: pw.TextAlign.justify))
            ])
          ]));
    }

    _experiances() {
      return List.generate(
          workExp.length > 2 ? 2 : workExp.length,
          (index) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 5, left: 10),
                  child: pw.Text("${workExp[index].from!.year} - ${workExp[index].to!.year}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 2, left: 10),
                  child: pw.Text("${workExp[index].jobTitle}", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 2, left: 10),
                  child: pw.Text("${workExp[index].companeyName}", style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Container(
                    height: 90,
                    width: 320,
                    padding: const pw.EdgeInsets.only(left: 10),
                    child: pw.Text(
                        //450
                        workExp[index].experiance!,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.normal, font: ttf1, fontSize: 10),
                        textAlign: pw.TextAlign.justify))
              ]));
    }

    _experiancesp2() {
      if (workExp.length <= 2) return List.generate(1, (index) => pw.Container());
      return List.generate(
          workExp.length - 2,
          (index) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 5, left: 10),
                  child: pw.Text("${workExp[index + 2].from!.year} - ${workExp[index + 2].to!.year}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 2, left: 10),
                  child: pw.Text("${workExp[index + 2].jobTitle}", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 2, left: 10),
                  child: pw.Text("${workExp[index + 2].companeyName}", style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Container(
                    height: 90,
                    width: 320,
                    padding: const pw.EdgeInsets.only(left: 10),
                    child: pw.Text(
                        //450
                        workExp[index + 2].experiance!,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.normal, font: ttf1, fontSize: 10),
                        textAlign: pw.TextAlign.justify))
              ]));
    }

    _experiancep1() {
      if (workExp.isEmpty) return pw.Container();
      return pw.Container(
          height: 320,
          child: pw.Row(children: [
            //leftSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.SizedBox(height: 10),
              pw.Image(workExperiance, width: 30, height: 30),
              pw.SizedBox(height: 3),
              pw.Container(height: 275, width: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1))),
            ]),
            //rightSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.SizedBox(height: 10),
              pw.Container(
                height: 20,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
                  pw.Text("Work Experiance", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Container(width: 100, height: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1)))
                ]),
              ),
              ..._experiances()
            ])
          ]));
    }

    _experiancep2() {
      if (workExp.length <= 2) return pw.Container();
      return pw.Container(
          height: 320,
          child: pw.Row(children: [
            //leftSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.SizedBox(height: 10),
              pw.Image(workExperiance, width: 30, height: 30),
              pw.SizedBox(height: 3),
              pw.Container(height: 275, width: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1))),
            ]),
            //rightSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.SizedBox(height: 10),
              pw.Container(
                height: 20,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
                  pw.Text("Work Experiance (Continued)", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Container(width: 20, height: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1)))
                ]),
              ),
              ..._experiancesp2()
            ])
          ]));
    }

    _hobbiesM() {
      return List.generate(
          hobbies.length,
          (index) => pw.Container(
              margin: const pw.EdgeInsets.only(left: 5),
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black, width: 2), borderRadius: pw.BorderRadius.circular(10)),
              child: pw.Center(child: pw.Text("${hobbies[index].hobby}"))));
    }

    _hobbies() {
      return pw.Container(
          height: 120,
          child: pw.Row(children: [
            //leftSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.SizedBox(height: 10),
              pw.Image(hobby, width: 30, height: 30),
              pw.SizedBox(height: 3),
              pw.Container(height: 70, width: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1))),
            ]),
            //rightSideProfile()
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.SizedBox(height: 10),
              pw.Container(
                height: 20,
                padding: const pw.EdgeInsets.only(left: 10),
                child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
                  pw.Text("Hobbies", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 5),
                  pw.Container(width: 150, height: 2, decoration: pw.BoxDecoration(color: PdfColors.black, borderRadius: pw.BorderRadius.circular(1)))
                ]),
              ),
              pw.SizedBox(height: 10),
              pw.Wrap(children: _hobbiesM()),
            ])
          ]));
    }

    _rightSide() {
      return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [_header(), _info(), _profile(), _experiancep1()]);
    }

    _rightSidep2() {
      return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
        _experiancep2(),
        _hobbies(),
      ]);
    }

    double pages = ((skills.length * 32 * 2 + educations.length * 48) + (80 + 55 + 100)) / 728;
    print(["pages", (pages.toInt()) + 1]);
    final pdf = pw.Document();

    //Page1
    pdf.addPage(pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context c) {
          return pw.Container(
              child: pw.Row(children: [
            pw.Expanded(
                flex: 1,
                child: pw.Container(
                    child: _leftSide(),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex("#2a2a2a"),
                      // boxShadow: const [pw.BoxShadow(color: PdfColors.grey100, offset: PdfPoint(10, -10), blurRadius: 10, spreadRadius: 10)])
                    ))),
            pw.Expanded(
                flex: 2,
                child: pw.Container(
                    margin: const pw.EdgeInsets.only(left: 2.5),
                    padding: const pw.EdgeInsets.all(30),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                          bottom: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          ),
                          right: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          ),
                          top: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          )),
                      color: PdfColors.white,
                    ),
                    child: _rightSide())),
          ]));
        }));
    //Page two
    pdf.addPage(pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context c) {
          return pw.Container(
              child: pw.Row(children: [
            pw.Expanded(
                flex: 1,
                child: pw.Container(
                    child: _leftSidep2(),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex("#2a2a2a"),
                      // boxShadow: const [pw.BoxShadow(color: PdfColors.grey100, offset: PdfPoint(10, -10), blurRadius: 10, spreadRadius: 10)])
                    ))),
            pw.Expanded(
                flex: 2,
                child: pw.Container(
                    margin: const pw.EdgeInsets.only(left: 2.5),
                    padding: const pw.EdgeInsets.all(30),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                          bottom: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          ),
                          right: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          ),
                          top: pw.BorderSide(
                            width: 5,
                            color: PdfColors.amber,
                          )),
                      color: PdfColors.white,
                    ),
                    child: _rightSidep2())),
          ]));
        }));
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(build: (c) async => await pdf.save()),
    );
  }
}

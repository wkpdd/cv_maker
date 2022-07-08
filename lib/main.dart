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
import 'package:cv_maker/templates/template1.dart';
import 'package:cv_maker/widgets/add_award_widget.dart';
import 'package:cv_maker/widgets/add_education_widget.dart';
import 'package:cv_maker/widgets/add_expertise_widget.dart';
import 'package:cv_maker/widgets/add_hobby_widget.dart';
import 'package:cv_maker/widgets/add_language_widget.dart';
import 'package:cv_maker/widgets/add_skill_widget.dart';
import 'package:cv_maker/widgets/add_work_experiance_widget.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  pw.ImageProvider? imageProvider;
  pw.ImageProvider? icon;
  pw.ImageProvider? skill;
  pw.ImageProvider? language;
  pw.ImageProvider? location;
  pw.ImageProvider? mail;
  pw.ImageProvider? expertise;
  pw.ImageProvider? award;
  pw.ImageProvider? profile;
  pw.ImageProvider? refrence;
  pw.ImageProvider? workExperiance;
  pw.ImageProvider? hobby;
  pw.ImageProvider? referenceP;
  pw.ImageProvider? phone;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController cs = TextEditingController();
  final TextEditingController abt = TextEditingController();
  // final TextEditingController fname = TextEditingController();
  // final TextEditingController fname = TextEditingController();

  List<Language> languages = [];
  List<Award> awards = [];
  List<WorkExperiance> workExperiences = [];
  List<SkillModel> skills = [];
  List<SocialMedia> socialMedia = [];
  List<EducationModel> educations = [];
  List<Expertise> expertises = [];
  List<HobbyModel> hobbies = [];

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    imageProvider = await imageFromAssetBundle("assets/images/proto_person.jpeg");
    icon = await imageFromAssetBundle("assets/icons/school.png");
    skill = await imageFromAssetBundle("assets/icons/skills.png");
    language = await imageFromAssetBundle("assets/icons/language.png");
    phone = await imageFromAssetBundle("assets/icons/phone.png");
    location = await imageFromAssetBundle("assets/icons/location.png");
    mail = await imageFromAssetBundle("assets/icons/email.png");
    award = await imageFromAssetBundle("assets/icons/awards.png");
    expertise = await imageFromAssetBundle("assets/icons/expertises.png");
    profile = await imageFromAssetBundle("assets/icons/profile.png");
    hobby = await imageFromAssetBundle("assets/icons/hobby.png");
    referenceP = await imageFromAssetBundle("assets/icons/reference_p.png");
    workExperiance = await imageFromAssetBundle("assets/icons/work_experiance.png");
    refrence = await imageFromAssetBundle("assets/icons/reference.png");
  }

  onPressed() {
    if (_key.currentState!.validate()) {
      final User user =
          User(fname: fname.text, lname: lname.text, email: email.text, address: address.text, phone: phonenumber.text, currentState: cs.text);
      final EducationModel educationModel = EducationModel(from: 2016, to: 2019, university: "Ahmed Draia", degree: "Bachelor");
      final SkillModel skillModel = SkillModel(skill: "skill 1", howGood: 50);
      final SkillModel skillModel1 = SkillModel(skill: "skill 2", howGood: 70);
      final SkillModel skillModel2 = SkillModel(skill: "skill 3", howGood: 20);
      final Language language1 = Language(comment: "Native", language: "Arabic", level: 70);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Template1(
                template1_model: Template1_model(firstname: "dd", lastname: "f", city: "s", phone: "+213 "),
                imageProvider: imageProvider!,
                icon: icon!,
                skill: skill!,
                language: language!,
                award: award!,
                expertise: expertise!,
                hobby: hobby!,
                profile: profile!,
                referenceP: referenceP!,
                refrence: refrence!,
                workExperiance: workExperiance!,
                user: user,
                hobbies: hobbies,
                awards: awards,
                workExp: workExperiences,
                expertises: expertises,
                languages: languages,
                socialmedias: const [],
                educations: educations,
                skills: skills,
                about: ProfileModel(about: abt.text),
                phone: phone!,
                location: location!,
                mail: mail!),
          ));
    }
  }

  addLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddLanguageWidget(onSave: (Language language) {
            setState(() {
              languages.add(language);
            });
          });
        });
  }

  addAward() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddAwardWidget(onSave: (Award award) {
            setState(() {
              awards.add(award);
            });
          });
        });
  }

  addWorkExperiance() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddWorkExperianceWidget(onSave: (WorkExperiance exp) {
            setState(() {
              workExperiences.add(exp);
            });
          });
        });
  }

  addSkill() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddSkillWidget(onSave: (SkillModel skill) {
            setState(() {
              skills.add(skill);
            });
          });
        });
  }

  addHobby() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddHobbyWidget(onSave: (HobbyModel hobby) {
            setState(() {
              hobbies.add(hobby);
            });
          });
        });
  }

  addSocialMedia() {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return AddSocialMediaWidget(onSave: (SocialMedia sm) {
    //         setState(() {
    //           socialMedia.add(sm);
    //         });
    //       });
    //     });
  }
  addEducation() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddEducationWidget(onSave: (EducationModel sm) {
            setState(() {
              educations.add(sm);
            });
          });
        });
  }

  addExpertise() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddExpertiseWidget(onSave: (Expertise sm) {
            setState(() {
              expertises.add(sm);
            });
          });
        });
  }

  _clangs() {
    if (languages.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Languages",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              languages.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${languages[index].language} | ${(languages[index].level)!.round()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              languages.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _ceduc() {
    if (educations.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Educations",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              educations.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 260,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text("${educations[index].degree}", style: const TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              educations.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _cskliis() {
    if (skills.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Skills",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              skills.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${skills[index].skill} | ${(skills[index].howGood)!.round()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              skills.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _chobbies() {
    if (hobbies.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hobbies",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              hobbies.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${hobbies[index].hobby}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              hobbies.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _cwes() {
    if (workExperiences.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Work Experiances",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              workExperiences.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${workExperiences[index].companeyName}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              workExperiences.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _cexps() {
    if (expertises.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Expertises",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              expertises.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${expertises[index].expertise}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              expertises.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  _cawards() {
    if (awards.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Awards",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 3,
        ),
        Wrap(
          children: List.generate(
              awards.length,
              (index) => Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      Text(
                        "${awards[index].award} | ${(awards[index].place)}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              skills.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ]),
                  )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Text("General Informtaion"),
                  TextFormField(
                    controller: fname,
                    decoration: const InputDecoration(hintText: "Firstname"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lname,
                    decoration: const InputDecoration(hintText: "Lastname"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(hintText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phonenumber,
                    decoration: const InputDecoration(hintText: "Phone"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: address,
                    decoration: const InputDecoration(hintText: "Address"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: cs,
                    decoration: const InputDecoration(hintText: "Current Job"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: abt,
                    decoration: const InputDecoration(hintText: "About your self"),
                    maxLength: 850,
                    maxLines: 8,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Should not be empty";
                      if (value.length < 200) return "minimum of 200 character";
                      return null;
                    },
                  ),
                  _ceduc(),
                  _clangs(),
                  _cskliis(),
                  _chobbies(),
                  _cwes(),
                  _cexps(),
                  _cawards(),
                  TextButton(onPressed: educations.length <= 4 ? addEducation : () {}, child: const Text("Add Education")),
                  TextButton(onPressed: languages.length <= 4 ? addLanguage : () {}, child: const Text("Add Language")),
                  TextButton(onPressed: skills.length <= 6 ? addSkill : () {}, child: const Text("Add Skill")),
                  TextButton(onPressed: hobbies.length <= 2 ? addHobby : () {}, child: const Text("Add hobby")),
                  TextButton(onPressed: workExperiences.length <= 2 ? addWorkExperiance : () {}, child: const Text("Add work experiance")),
                  TextButton(onPressed: expertises.length <= 6 ? addExpertise : () {}, child: const Text("Add expertise")),
                  TextButton(onPressed: awards.length <= 4 ? addAward : () {}, child: const Text("Add award")),
                  // TextButton(
                  //     onPressed: () async {
                  //       final result = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                  //       if (result != null) {
                  //         imageProvider = pw.MemoryImage(await result.readAsBytes());
                  //       }
                  //     },
                  //     child: const Text("Add Image")),
                  TextButton(onPressed: onPressed, child: const Text("Go")),
                ],
              ),
            )));
  }
}

/**
 * 
 * 
 *  onPressed: () {
          final User user = User(
              fname: "Elwannas",
              lname: "Hiri",
              email: "hiri.elwannas@gmail.com",
              address: "Adress Kbira chouia",
              phone: "+213 556357665",
              currentState: "Flutter Developer");
          final EducationModel educationModel = EducationModel(from: 2016, to: 2019, university: "Ahmed Draia", degree: "Bachelor");
          final SkillModel skillModel = SkillModel(skill: "skill 1", howGood: 50);
          final SkillModel skillModel1 = SkillModel(skill: "skill 2", howGood: 70);
          final SkillModel skillModel2 = SkillModel(skill: "skill 3", howGood: 20);
          final Language language1 = Language(comment: "Native", language: "Arabic", level: 70);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Template1(
                    template1_model: Template1_model(firstname: "dd", lastname: "f", city: "s", phone: "+213 "),
                    imageProvider: imageProvider!,
                    icon: icon!,
                    skill: skill!,
                    language: language!,
                    award: award!,
                    expertise: expertise!,
                    hobby: hobby!,
                    profile: profile!,
                    referenceP: referenceP!,
                    refrence: refrence!,
                    workExperiance: workExperiance!,
                    user: user,
                    awards: const [],
                    expertises: const [],
                    languages: [language1, language1],
                    socialmedias: const [],
                    educations: [
                      educationModel,
                      educationModel,
                      educationModel,
                      educationModel,
                      educationModel,
                    ],
                    skills: [
                      skillModel,
                      skillModel1,
                      skillModel,
                      skillModel1,
                    ],
                    phone: phone!,
                    location: location!,
                    mail: mail!),
              ));
        },
 * 
 * 
 */

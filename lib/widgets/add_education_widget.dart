import 'package:cv_maker/models/education_model.dart';
import 'package:flutter/material.dart';

class AddEducationWidget extends StatefulWidget {
  Function onSave;
  AddEducationWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddEducationWidget> createState() => _AddWorkExperianceWidgetState();
}

class _AddWorkExperianceWidgetState extends State<AddEducationWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _degreeControllorer = TextEditingController();
  final TextEditingController _universityControllorer = TextEditingController();
  final TextEditingController _fromControllorer = TextEditingController();
  final TextEditingController _toControllorer = TextEditingController();
  int dateTime = 2000;
  int dateTimeEnd = DateTime.now().year;

  onSave() {
    if (_key.currentState!.validate()) {
      final EducationModel we = EducationModel(
        from: int.parse(_fromControllorer.text),
        to: dateTime,
        degree: _degreeControllorer.text,
        university: _universityControllorer.text,
      );
      widget.onSave(we);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _key,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ListView(children: [
            TextFormField(
              controller: _degreeControllorer,
              decoration: const InputDecoration(hintText: "Degree"),
              maxLength: 30,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _universityControllorer,
              decoration: const InputDecoration(hintText: "College / University"),
              maxLength: 40,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _fromControllorer,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "From"),
              maxLength: 40,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                try {
                  int.parse(value);
                } catch (e) {
                  return "This should be a year";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _toControllorer,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "To"),
              maxLength: 40,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                try {
                  int.parse(value);
                } catch (e) {
                  return "This should be a year";
                }
                return null;
              },
            ),
            TextButton(onPressed: onSave, child: const Text("Add Experiance")),
          ]),
        ),
      ),
    );
  }
}

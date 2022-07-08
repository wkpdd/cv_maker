import 'package:cv_maker/models/work_experiance.dart';
import 'package:flutter/material.dart';

class AddWorkExperianceWidget extends StatefulWidget {
  Function onSave;
  AddWorkExperianceWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddWorkExperianceWidget> createState() => _AddWorkExperianceWidgetState();
}

class _AddWorkExperianceWidgetState extends State<AddWorkExperianceWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _jobControllorer = TextEditingController();
  final TextEditingController _experianceControllorer = TextEditingController();
  final TextEditingController _companeyControllorer = TextEditingController();
  DateTime dateTime = DateTime.now();
  DateTime dateTimeEnd = DateTime.now();

  onSave() {
    if (_key.currentState!.validate()) {
      final WorkExperiance we = WorkExperiance(
          from: dateTime,
          to: dateTime,
          experiance: _experianceControllorer.text,
          jobTitle: _jobControllorer.text,
          companeyName: _companeyControllorer.text);
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
              controller: _companeyControllorer,
              decoration: const InputDecoration(hintText: "Name Of Companey"),
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _jobControllorer,
              decoration: const InputDecoration(hintText: "Job Title"),
              maxLength: 100,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _experianceControllorer,
              decoration: const InputDecoration(hintText: "Write your story!"),
              maxLength: 450,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime.now(),
                onDateChanged: (d) {
                  setState(() {
                    dateTime = d;
                  });
                }),
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime.now(),
                onDateChanged: (d) {
                  setState(() {
                    dateTimeEnd = d;
                  });
                }),
            TextButton(onPressed: onSave, child: const Text("Add Experiance")),
          ]),
        ),
      ),
    );
  }
}

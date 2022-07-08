import 'package:cv_maker/models/award_model.dart';
import 'package:flutter/material.dart';

class AddAwardWidget extends StatefulWidget {
  Function onSave;
  AddAwardWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddAwardWidget> createState() => _AddAwardWidgetState();
}

class _AddAwardWidgetState extends State<AddAwardWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _awardControllorer = TextEditingController();
  final TextEditingController _placeControllorer = TextEditingController();
  DateTime dateTime = DateTime.now();

  onSave() {
    if (_key.currentState!.validate()) {
      final Award award = Award(award: _awardControllorer.text, place: _placeControllorer.text, date: dateTime);
      widget.onSave(award);
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
          child: Column(children: [
            TextFormField(
              controller: _awardControllorer,
              decoration: const InputDecoration(hintText: "Award"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _placeControllorer,
              decoration: const InputDecoration(hintText: "Place of Award"),
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
            TextButton(onPressed: onSave, child: const Text("Add award")),
          ]),
        ),
      ),
    );
  }
}

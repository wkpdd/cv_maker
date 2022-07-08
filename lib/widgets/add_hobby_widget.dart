import 'package:cv_maker/models/hobby_model.dart';
import 'package:cv_maker/models/skill_model.dart';
import 'package:flutter/material.dart';

class AddHobbyWidget extends StatefulWidget {
  Function onSave;
  AddHobbyWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddHobbyWidget> createState() => _AddHobbyWidgetState();
}

class _AddHobbyWidgetState extends State<AddHobbyWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _hobbyControllorer = TextEditingController();
  double level = 0;

  onSave() {
    if (_key.currentState!.validate()) {
      final HobbyModel hobby = HobbyModel(hobby: _hobbyControllorer.text);
      widget.onSave(hobby);
      Navigator.pop(context);
    }
  }

  onChanged(v) {
    setState(() {
      level = v;
    });
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
              controller: _hobbyControllorer,
              decoration: const InputDecoration(hintText: "Hobby"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextButton(onPressed: onSave, child: const Text("Add Hobby")),
          ]),
        ),
      ),
    );
  }
}

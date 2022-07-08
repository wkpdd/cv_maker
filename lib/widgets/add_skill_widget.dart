import 'package:cv_maker/models/skill_model.dart';
import 'package:flutter/material.dart';

class AddSkillWidget extends StatefulWidget {
  Function onSave;
  AddSkillWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddSkillWidget> createState() => _AddSkillWidgetState();
}

class _AddSkillWidgetState extends State<AddSkillWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _skillControllorer = TextEditingController();
  double level = 0;

  onSave() {
    if (_key.currentState!.validate()) {
      final SkillModel skill = SkillModel(skill: _skillControllorer.text, howGood: level.round().toDouble());
      widget.onSave(skill);
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
              controller: _skillControllorer,
              decoration: const InputDecoration(hintText: "Skill"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            Slider(
              value: level,
              onChanged: onChanged,
              min: 0,
              max: 100,
              label: "$level",
            ),
            TextButton(onPressed: onSave, child: Text("Add Skill ${level.round()}")),
          ]),
        ),
      ),
    );
  }
}

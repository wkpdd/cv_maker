import 'package:cv_maker/models/language_model.dart';
import 'package:flutter/material.dart';

class AddLanguageWidget extends StatefulWidget {
  Function onSave;
  AddLanguageWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddLanguageWidget> createState() => _AddLanguageWidgetState();
}

class _AddLanguageWidgetState extends State<AddLanguageWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _languageControllorer = TextEditingController();
  final TextEditingController _commentControllorer = TextEditingController();
  double level = 0;

  onChanged(v) {
    setState(() {
      level = v;
    });
  }

  onSave() {
    if (_key.currentState!.validate()) {
      final Language language = Language(language: _languageControllorer.text, comment: _commentControllorer.text, level: level);
      widget.onSave(language);
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
              controller: _languageControllorer,
              decoration: const InputDecoration(hintText: "Language"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextFormField(
              controller: _commentControllorer,
              decoration: const InputDecoration(hintText: "Comment"),
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
            TextButton(
                onPressed: onSave, child: Text("Add Language ${_languageControllorer.text} | ${_commentControllorer.text} | ${level.round()}")),
          ]),
        ),
      ),
    );
  }
}

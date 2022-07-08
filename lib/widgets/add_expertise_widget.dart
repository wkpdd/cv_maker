import 'package:cv_maker/models/expertise_model.dart';
import 'package:flutter/material.dart';

class AddExpertiseWidget extends StatefulWidget {
  Function onSave;
  AddExpertiseWidget({required this.onSave, Key? key}) : super(key: key);

  @override
  State<AddExpertiseWidget> createState() => _AddHobbyWidgetState();
}

class _AddHobbyWidgetState extends State<AddExpertiseWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _expertiseControllorer = TextEditingController();
  double level = 0;

  onSave() {
    if (_key.currentState!.validate()) {
      final Expertise expr = Expertise(expertise: _expertiseControllorer.text);
      widget.onSave(expr);
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
              controller: _expertiseControllorer,
              decoration: const InputDecoration(hintText: "Expertise"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Should not be empty";
                return null;
              },
            ),
            TextButton(onPressed: onSave, child: const Text("Add Expertise")),
          ]),
        ),
      ),
    );
  }
}

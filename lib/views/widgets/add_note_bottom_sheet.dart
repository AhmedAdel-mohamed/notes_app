import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNoteForm();
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 23),
              CustomTextField(
                hint: "Title",
                maxLines: 1,
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hint: "Content",
                maxLines: 5,
                onSaved: (value) {
                  subTitle = value;
                },
              ),
              SizedBox(height: 32),
              CustomButton(
                onTap: (){
                  if (formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }else{
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

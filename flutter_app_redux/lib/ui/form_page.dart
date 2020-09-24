import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/form_model_example.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final FormModelExample _model = FormModelExample();
  TextEditingController _emailController;
  TextEditingController _nameController;
  FocusNode _emailFocusNode;
  FocusNode _nameFocusNode;


  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
  }


  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              contentPadding: const EdgeInsets.all(5.0),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200]
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(_nameFocusNode);
            },
            validator: (String value) {
              if (!EmailValidator.validate(value)) {
                return "Invalid email";
              }

              return null;
            },
            onSaved: (String value) {
              _model.email = value;
            },
          ),
          TextFormField(
            controller: _nameController,
            focusNode: _nameFocusNode,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                hintText: "Name",
                contentPadding: const EdgeInsets.all(5.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200]
            ),
            textInputAction: TextInputAction.done,
            validator: (String value) {
              if (value == null || value.length < 4) {
                return "Invalid name";
              }

              return null;
            },
            onSaved: (String value) {
              _model.name = value;
            },
          ),
          RaisedButton(
            color: Colors.yellow,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("$_model.name - $_model.email");
              }
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}

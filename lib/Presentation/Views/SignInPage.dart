import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/Presentation/Views/HomePage.dart';
import 'package:untitled1/Presentation/Views/QuizPage.dart';
import '../../Common/LoginValidator.dart';
import '../../Auth/AuthHandler.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _nameTextController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Name",
                    hintText: "",
                    fillColor: Colors.black12,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Email",
                    hintText: "",
                    fillColor: Colors.black12,
                  ),
                  // validator: (value) => Validator.validateEmail(email: _emailTextController.text),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordTextController,
                  obscureText: true,
                  validator: (value) => Validator.validatePassword(password: _passwordTextController.text),
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Password",
                    hintText: "",
                    fillColor: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      User? user = await AuthHandler.signInUsingEmailPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                        context: context
                      );
                      if (user != null) {
                        Navigator.of(context)
                            .pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      User? user = await AuthHandler.registerUsingEmailPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                          name: _nameTextController.text
                      );
                      if (user != null) {
                        Navigator.of(context)
                            .pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
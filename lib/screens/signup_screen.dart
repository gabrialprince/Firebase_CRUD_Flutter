import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_new/reusable_widget/reusable_widget.dart';
import 'package:firebase_flutter_new/screens/homepage_screen.dart';

import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BoxDecoration,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FontWeight,
        Icons,
        Key,
        LinearGradient,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        Padding,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextStyle,
        Widget;

import '../utils/colors_util.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    // ignore: avoid_print
                    print("Created New Account");
                    Navigator.push(
                        context,
                        // ignore: prefer_const_constructors
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    // ignore: avoid_print
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }
}

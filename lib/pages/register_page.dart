// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/pages/home_page.dart';
import 'package:new_app/pages/login_page.dart';
import 'package:new_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/user_model_.dart';

class registerpage extends StatefulWidget {
  const registerpage({Key? key}) : super(key: key);

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _auth = FirebaseAuth.instance;
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmpasswordEditingController = TextEditingController();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      // color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Sign up ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 25.0),
                child: Column(
                  children: [
                    // name field
                    TextFormField(
                      controller: firstNameEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Name can not be empty");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Name ",
                        labelText: "Name",
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                    ),

                    // email field
                    TextFormField(
                      autofocus: false,
                      controller: emailEditingController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Email ",
                          labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please Enter Your Email";
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),

                    // password field
                    TextFormField(
                      obscureText: true,
                      controller: passwordEditingController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Passward id Required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter Valid Password(Min 6. characters)");
                        }
                        return null;
                      },
                    ),

                    // confirm password field
                    TextFormField(
                      autofocus: false,
                      controller: confirmpasswordEditingController,
                      obscureText: true,
                      validator: (value) {
                        if (confirmpasswordEditingController.text !=
                            passwordEditingController.text) {
                          return "Password dont match";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmpasswordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: "Confirm Password",
                      ),
                    ),
                    // signup button
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width / 3,
                        onPressed: () {
                          signUp(emailEditingController.text,
                              passwordEditingController.text);
                        },
                        child: const Text(
                          'signUp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const loginpage()));
                          },
                          child: const Text(
                            "login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our usermodel
    // calling these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfuly");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}

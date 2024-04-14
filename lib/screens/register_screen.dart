import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../widgets/custom_matrial_button.dart';
import '../widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static String RouteName = "Register Screen";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
bool isVisabile = false;
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/chatlogo.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    label: "First Name",
                    title: "enter your first name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: "Last Name",
                    title: "enter your first name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your e-mail address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "invalid e-mail address";
                      }
                    },
                    controller: emailController,
                    label: "Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    obsecure: !isVisabile,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isVisabile = !isVisabile;
                        setState(() {});
                      },
                      child: isVisabile == true
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                    ),
                    controller: passwordController,
                    label: "password",
                  ),
                  CustomMatrialButton(
                      color: Colors.blue, text: "Register", onClick: () async {
                        await register(context);
                      },

                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        //call api
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        EasyLoading.dismiss();
        Navigator.pop(context);
        print(credential.user?.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          EasyLoading.dismiss();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          EasyLoading.dismiss();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

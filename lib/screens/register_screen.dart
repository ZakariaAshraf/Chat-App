import 'package:flutter/material.dart';

import '../widgets/custom_matrial_button.dart';
import '../widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static String RouteName = "Register Screen";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    bool isVisabile = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                    color: Colors.blue, text: "Register", onClick: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

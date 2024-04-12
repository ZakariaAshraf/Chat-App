import 'package:chatapp/widgets/custom_matrial_button.dart';
import 'package:chatapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);
  static String RouteName = "Sign In Screen";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isVisabile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/chatlogo.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40,),
              CustomTextFormField(validator: (value) {
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
                label: "Email",),
              SizedBox(height: 20,),
              CustomTextFormField( obsecure: !isVisabile,
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
                label: "password",),
              CustomMatrialButton(color: Colors.blue, text: "Let's Go", onClick: (){})
            ],
          )
        ],

      ),
    );
  }
}

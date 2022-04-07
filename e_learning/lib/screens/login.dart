import 'dart:developer';

import 'package:e_learning/api/auth.dart';
import 'package:e_learning/constants/constants.dart';
import 'package:e_learning/models/video_call_param.dart';
import 'package:e_learning/screens/video_call.dart';
import 'package:e_learning/shared_preference/shared_prefernces.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginLearning extends StatefulWidget {
  //final loginFormController = FormContro
  const LoginLearning({Key? key}) : super(key: key);

  @override
  State<LoginLearning> createState() => _LoginLearningState();
}

class _LoginLearningState extends State<LoginLearning> {
  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(20.0));
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Welcome to Nrich Learning"),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                child: CircleAvatar(
                  child: Image.asset(
                    "assets/images/logo-letter-9.png",
                    fit: BoxFit.cover,
                    // height: ,
                  ),
                  backgroundImage:
                      const AssetImage("assets/images/logo-letter-9.png"),
                  radius: 80,
                ),
                height: size.height * 0.3,
                width: size.width,
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.black12,
                ),
                child: TextFormField(
                  // maxLines: 2,
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email id",
                    icon: const Icon(Icons.email),
                    border: inputBorder,
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black38,
              ),
              const SizedBox(
                height: sizedBoxHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.black12,
                ),
                child: TextFormField(
                  // maxLines: 2,
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.key),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    errorBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black38,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //  Button(text: "Login", onPress: () {}),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 20.0),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      login(emailController.text, passwordController.text,
                          context);
                    }
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("OR"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "New to Nrich "),
                      TextSpan(text: "Register")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login(username, password, context) {
  AuthApiService().login(username, password).then((value) async {
    SharedPreferenceData().addAuthData(value);
    permissions();
    String url = await VideoCallParam().toJson();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VideoCallWebView(url: url)),
    );
  });
}

void permissions() async {
  if (await Permission.camera.request().isGranted) {
    log("Camera permission is granted");
  }
  if (await Permission.microphone.request().isGranted) {
    log("Audio permission is granted");
  }
}

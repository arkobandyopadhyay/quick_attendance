import 'package:quick_attendance/resources/authentication_methods.dart';
import 'package:quick_attendance/screens/sign_in_screens.dart';
import 'package:quick_attendance/utils/utils.dart';
import 'package:quick_attendance/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_main_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    branchController.dispose();
    rollnoController.dispose();
    semesterController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.8,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 28),
                            ),
                            TextFieldWidget(
                              title: "Name",
                              controller: nameController,
                              obsecureText: false,
                              hintText: "Enter your name",
                            ),
                            TextFieldWidget(
                              title: "Branch",
                              controller: branchController,
                              obsecureText: false,
                              hintText: "Enter your Address",
                            ),
                            TextFieldWidget(
                              title: "Semester",
                              controller: semesterController,
                              obsecureText: false,
                              hintText: "Enter your Address",
                            ),
                            TextFieldWidget(
                              title: "Roll NO",
                              controller: rollnoController,
                              obsecureText: false,
                              hintText: "Enter your Address",
                            ),
                            TextFieldWidget(
                              title: "Email",
                              controller: emailController,
                              obsecureText: false,
                              hintText: "Enter your Email id",
                            ),
                            TextFieldWidget(
                              title: "Password",
                              controller: passwordController,
                              obsecureText: true,
                              hintText: "Enter your password",
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                color: Colors.yellow,
                                isLoading: isLoading,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  String output =
                                      await authenticationMethods.signUpUser(
                                          name: nameController.text,
                                          branch: branchController.text,
                                          rollno: rollnoController.text,
                                          semester: semesterController.text,
                                          email: emailController.text,
                                          password: passwordController.text);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (output != "success") {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignInScreen()));
                                  }
                                },
                                child: const Text(
                                  "Sign-Up",
                                  style: TextStyle(
                                      letterSpacing: 0.6, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomMainButton(
                        color: Colors.grey,
                        isLoading: false,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: ((context) {
                              return const SignInScreen();
                            })),
                          );
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              letterSpacing: 0.6, color: Colors.black),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

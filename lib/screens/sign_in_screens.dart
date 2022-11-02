import 'package:quick_attendance/resources/authentication_methods.dart';
import 'package:quick_attendance/screens/home_screens.dart';
import 'package:quick_attendance/screens/sign_up_screens.dart';
import 'package:quick_attendance/utils/utils.dart';
import 'package:quick_attendance/widgets/custom_main_widgets.dart';
import 'package:quick_attendance/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.7,
                    padding: const EdgeInsets.all(25),
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
                          "Sign-In",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 28),
                        ),
                        TextFieldWidget(
                          title: "User",
                          controller: userController,
                          obsecureText: false,
                          hintText: "Enter your Profile",
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
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: ((context) {
                                  return const HomeScreen();
                                })),
                              );
                            },
                            child: const Text(
                              "Sign-In",
                              style: TextStyle(
                                  letterSpacing: 0.6, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "New to App?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  CustomMainButton(
                      color: Colors.grey,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: ((context) {
                            return const SignUpScreen();
                          })),
                        );
                      },
                      child: const Text(
                        "Create an Account",
                        style:
                            TextStyle(letterSpacing: 0.6, color: Colors.black),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}

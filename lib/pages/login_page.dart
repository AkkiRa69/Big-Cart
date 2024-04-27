// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_store/components/app_bar.dart';
import 'package:grocery_store/pages/home_page.dart';
import 'package:grocery_store/pages/signup_page.dart';
import 'package:grocery_store/pages/welcome_page.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  void backToWelcomePage(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: WelcomePage(), type: PageTransitionType.leftToRight));
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        () {
          backToWelcomePage(context);
        },
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset("assets/images/cover2.png"),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in to your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        //email text field
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                              hintText: "Email address",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        //password text field
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        //remember me
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.toggle_off_outlined,
                                    color: Colors.grey,
                                    size: 32,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Forgot password",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF407EC7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //login button
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                // Colors.white,
                                Color.fromARGB(255, 190, 249, 192),
                                Color.fromARGB(255, 136, 241, 140),
                                const Color.fromARGB(255, 95, 236, 100),
                              ],
                            ),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(18),
                            ),
                            onPressed: () {
                              navigateToHomePage(context);
                            },
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //sign up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: SignUpPage(),
                                  type: PageTransitionType.rightToLeft));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

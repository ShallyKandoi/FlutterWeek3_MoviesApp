import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignupScreen.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        resizeToAvoidBottomInset: false,
        body: Builder(
            builder: (BuildContext context) => Column(children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                    child: const SizedBox(
                      width: 350,
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/appLogo.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 0, right: 250, bottom: 5),
                    child: const Text(
                      'Email Address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 0, right: 280, bottom: 5, top: 13),
                    child: const Text(
                      'Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 5),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          //TODO FORGOT PASSWORD SCREEN GOES HERE
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 360,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white54,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black54, fontSize: 25),
                      ),
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailAddress.text,
                            password: password.text,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext ctx) => HomeScreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                        ),
                      ]),
                ])));
  }
}

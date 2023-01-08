import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) => Column(
          children: <Widget>[
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
              padding: const EdgeInsets.only(left: 0, right: 250, bottom: 5),
              child: const Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Container(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
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
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 360,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                ),
                child: const Text(
                  'Sign-up',
                  style: TextStyle(color: Colors.black54, fontSize: 25),
                ),
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailAddress.text,
                      password: password.text,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => HomeScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// await user?.sendEmailVerification();
// await FirebaseAuth.instance.signOut();

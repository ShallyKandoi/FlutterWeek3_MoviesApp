
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'views/LoginScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: 'lib/.env');
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Movies App",
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black12,
          ),
          scaffoldBackgroundColor: Colors.black12,
        ),
        home: const LoginScreen(),
      ),
  );
}

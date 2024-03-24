import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti_admin/view/home_page.dart';
import 'package:sanskriti_admin/view/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC4JnP6PYZ6UoELCM_dPSUP--IRHIYzzQ4",
          authDomain: "sanskriti-by-okay-anshu.firebaseapp.com",
          databaseURL:
              "https://sanskriti-by-okay-anshu-default-rtdb.asia-southeast1.firebasedatabase.app",
          projectId: "sanskriti-by-okay-anshu",
          storageBucket: "sanskriti-by-okay-anshu.appspot.com",
          messagingSenderId: "43440781583",
          appId: "1:43440781583:web:814614fd4c58535a1aa67a",
          measurementId: "G-R5LD38S44N"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Sanskriti Admin App',
      home: const HomePage(),
    );
  }
}

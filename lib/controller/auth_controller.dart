import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti_admin/view/home_page.dart';

import 'package:sanskriti_admin/view/welcome_page.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();

  //login code
  void loginUser() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.snackbar(
        'Success',
        'Login Sucessfully',
      );
      emailController.clear();
      passwordController.clear();
      Get.offAll(const HomePage());
      //print("Login Sucessfully🫡🫡🫡");
      //Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please Enter valid Email!',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      //print('Unexpected error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

  //log out code
  void logOut() async {
    await auth.signOut();
    Get.offAll(const WelcomePage());
  }
}

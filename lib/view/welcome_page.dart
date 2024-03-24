import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:sanskriti_admin/controller/auth_controller.dart";
import "package:sanskriti_admin/utils/app_colors.dart";
import "package:sanskriti_admin/utils/custom_button.dart";
import "package:sanskriti_admin/utils/custom_formfield.dart";
import "package:sanskriti_admin/view/home_page.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            height: 500,
            width: 1000,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue),
            ),
            child: Column(
              children: [
                const Text(
                  "Welcome to Sanskriti Admin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("images/app_logo.png"),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Kindly Sign In to Continue",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          headingText: "Email",
                          hintText: "Email",
                          suffixIcon: const SizedBox(),
                          controller: authController.emailController,
                          maxLines: 1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          obsecureText: false,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          headingText: "Password",
                          hintText: "Enter Admin Password",
                          suffixIcon: const SizedBox(),
                          controller: authController
                              .passwordController, // Corrected controller
                          maxLines: 1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          obsecureText: true, // Changed from email to text
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AuthButton(
                            onTap: () {
                              authController.loginUser();
                              // Get.offAll(const HomePage());
                            },
                            text: "Admin Login"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

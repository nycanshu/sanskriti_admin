import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti_admin/controller/auth_controller.dart';
import 'package:sanskriti_admin/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightblueshade,
        title: const Text("Admin Home Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                authController.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2, // Adjust aspect ratio as needed
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.blueGrey, // Add color for demonstration
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

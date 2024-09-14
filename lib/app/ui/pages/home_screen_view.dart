import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/bottom_nav_controller.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    final bottomNavController = Get.find<BottomNavController>();

    return Scaffold(
      body:Obx(()=> bottomNavController.currentPage),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: bottomNavController.changePages,
          selectedItemColor: Colors.blue,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Issues',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

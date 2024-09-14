import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/bottom_nav_controller.dart';

import '../../utils/constants.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController =
        Get.find<BottomNavController>(); //finding_that_controller

    return Scaffold(
      body: Obx(() => bottomNavController.currentPage),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: bottomNavController.changePages,
          selectedItemColor: AppColors.selectedLabelColor,
          showSelectedLabels: true,
          selectedLabelStyle:
              const TextStyle(color: AppColors.selectedLabelColor),
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

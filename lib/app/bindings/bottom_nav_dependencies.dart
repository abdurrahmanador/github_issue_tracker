import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/bottom_nav_controller.dart';
import 'package:github_issue_tracker/app/controllers/issue_screen_controller.dart';
import 'package:github_issue_tracker/app/datas/repository/issue_repository/issue_repository.dart';
import 'package:github_issue_tracker/app/datas/services/api_services.dart';

class BottomNavBindings extends Bindings {
  @override
  void dependencies() {

    // binding_the_controller
    Get.lazyPut<BottomNavController>(() =>BottomNavController());
  }
}

import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/issue_screen_controller.dart';
import 'package:github_issue_tracker/app/datas/repository/issue_repository/issue_repository.dart';
import 'package:github_issue_tracker/app/datas/services/api_services.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // initializing_services_and_controllers_here.
    final apiServices = ApiServices();
    final issueRepository = IssueRepository(apiServices);

    // binding_the_controller
    Get.lazyPut<IssueScreenController>(() => IssueScreenController(issueRepository));
  }
}

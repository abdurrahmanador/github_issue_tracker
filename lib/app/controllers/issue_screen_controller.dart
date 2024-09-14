
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/datas/models/issue_data.dart';
import 'package:github_issue_tracker/app/datas/repository/issue_repository/issue_repository.dart';

class IssueScreenController extends GetxController {
  final IssueRepository issueRepository;
  IssueScreenController(this.issueRepository);

  RxList<IssueData> issueList = <IssueData>[].obs;//for_storing_all_issues
  RxList<IssueData> filteredIssueList=<IssueData>[].obs;//for_storing_filtered_issues

  RxString searchQuery = ''.obs;
  int issuesPerPage = 10;
  int page = 1;

  //for_showing_loader_till_fetch_data
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    fetchIssues();
    super.onInit();
  }

  //function_for_fetching_issues
  void fetchIssues() async {
    isLoading(true);
    try {
      final newIssues = await issueRepository.getIssues(issuesPerPage, page);
      if (newIssues != null) {
        issueList.addAll(newIssues);
        filteredIssueList.value = issueList
            .where((issue) => !(issue.title?.toLowerCase().contains('flutter') ?? false))
            .toList();
        page++;
      }
      // handle_case_when_no_more_issues_are_returned
      if (newIssues == null || newIssues.isEmpty) {
        Get.snackbar('', 'No more issues found!');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch issues: $e');
    } finally {
      isLoading(false);
    }
  }


  //function_for_search_functionality
  void filterIssue(String query){
    searchQuery.value=query;
    if(query.isEmpty){
      filteredIssueList.assignAll(issueList);
    }else{
      var result=issueList.where((issues) => issues.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
      filteredIssueList.assignAll(result);
    }
  }


  //function_for_fetching_issues_but_related_with_pagination
  void loadMore() {
    if (!isLoading.value) {
      fetchIssues();
    }
  }
}

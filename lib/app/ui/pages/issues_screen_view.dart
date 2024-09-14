import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/issue_screen_controller.dart';
import 'package:github_issue_tracker/app/datas/repository/issue_repository/issue_repository.dart';
import 'package:github_issue_tracker/app/datas/services/api_services.dart';
import 'package:github_issue_tracker/app/ui/widgets/issue_list_item.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_search_bar.dart';

class IssuesScreenView extends StatelessWidget {
  const IssuesScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    final issueController = Get.find<IssueScreenController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Flutter Issue List",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        "master",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              //custom_search_bar
              CustomSearchBar(issueController: issueController),

              const SizedBox(height: 20),
              Expanded(

                // Use Obx to observe the issueList and update UI accordingly
                child: Obx(() {
                  if (issueController.filteredIssueList.isEmpty &&
                      issueController.isLoading.value) {
                    return const Center(
                      child:
                          CircularProgressIndicator(), // Show loading indicator if data is empty
                    );
                  } else {
                    return NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          //for_pagination_purpose
                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            issueController.loadMore();
                          }
                          return true;
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.grey,
                            );
                          },
                          itemCount: issueController.filteredIssueList.length,
                          itemBuilder: (context, index) {
                            final commit =
                                issueController.filteredIssueList[index];


                            final createdAt =
                                commit.createdAt.toString();


                            DateTime createdDate=DateTime.parse(createdAt);
                            DateTime currentDate=DateTime.now();
                            bool isToday=createdDate.year==currentDate.year&&createdDate.month==currentDate.month&&createdDate.day==currentDate.day;
                            String displayDate;
                            if(isToday){
                              displayDate=DateFormat('HH:mm').format(createdDate);
                            }else{
                              displayDate=DateFormat('yyyy-MM-dd').format(createdDate);

                            }

                            return IssueListItem(commit: commit, displayDate: displayDate); //Issue List Item from widgets folder
                          },
                        ));
                  }
                }),
              ),
              Obx(() => issueController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Container())
            ],
          ),
        ),
      ),
    );
  }
}


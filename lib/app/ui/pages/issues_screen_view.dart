import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/controllers/issue_screen_controller.dart';
import 'package:github_issue_tracker/app/datas/repository/issue_repository/issue_repository.dart';
import 'package:github_issue_tracker/app/datas/services/api_services.dart';
import 'package:github_issue_tracker/app/ui/widgets/issue_list_item.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';
import '../widgets/custom_search_bar.dart';

class IssuesScreenView extends StatelessWidget {
  const IssuesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final issueController =
        Get.find<IssueScreenController>(); //finding_or_calling_issue_controller

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
                    style: TextStyle(fontSize: TextSizes.medium),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(RadiusValues.radius16),
                      color: AppColors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        "master",
                        style: TextStyle(fontSize: TextSizes.small),
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
                              color: AppColors.grey,
                            );
                          },
                          itemCount: issueController.filteredIssueList.length,
                          itemBuilder: (context, index) {
                            final commit =
                                issueController.filteredIssueList[index];

                            final createdAt = commit.createdAt.toString();

                            //this_is_because_we_wanted_to_show_proper_time_if_any_issue_found_within_current_date_then
                            //_it_will_show_time_only_rest_will_show_dates
                            DateTime createdDate = DateTime.parse(createdAt);
                            DateTime currentDate = DateTime.now();
                            bool isToday =
                                createdDate.year == currentDate.year &&
                                    createdDate.month == currentDate.month &&
                                    createdDate.day == currentDate.day;
                            String displayDate;
                            if (isToday) {
                              displayDate =
                                  DateFormat('HH:mm').format(createdDate);
                            } else {
                              displayDate =
                                  DateFormat('yyyy-MM-dd').format(createdDate);
                            }

                            //showing_issue_items
                            return IssueListItem(
                                commit: commit,
                                displayDate:
                                    displayDate); //Issue List Item from widgets folder
                          },
                        ));
                  }
                }),
              ),
              //for_paginations_indicator
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

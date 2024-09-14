import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/utils/constants.dart';

class IssueDetailsView extends StatelessWidget {
  const IssueDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    String issue = Get.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:const  EdgeInsets.all(16),
            child: Column(
              children: [
                MarkdownBody(
                  data: issue.toString() ?? "No details available",
                  styleSheet: MarkdownStyleSheet(
                      p: const TextStyle(fontSize: TextSizes.medium),
                      code: const TextStyle(
                          fontSize: TextSizes.small,
                          color: AppColors.codeColor)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

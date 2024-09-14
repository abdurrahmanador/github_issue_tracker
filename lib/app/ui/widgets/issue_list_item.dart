import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/routes/routes.dart';

import '../../datas/models/issue_data.dart';

class IssueListItem extends StatelessWidget {
  final IssueData commit;  // Pass the issue data
  final String displayDate; // Pass the formatted date

  const IssueListItem({
    super.key,
    required this.commit,
    required this.displayDate,
  });

  @override
  Widget build(BuildContext context) {
    final assignee = commit.user?.login ?? 'No assignee';

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.issueDetails, arguments: commit.body);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    commit.title ?? 'No title',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Spacer(),
                Text(
                  displayDate,
                  style: const TextStyle(fontSize: 12),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Image.network(commit.user?.avatarUrl ?? ''),
                ),
                const SizedBox(width: 8),
                Text(
                  assignee,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

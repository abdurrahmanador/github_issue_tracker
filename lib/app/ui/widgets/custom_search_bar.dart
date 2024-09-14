import 'package:flutter/material.dart';

import '../../controllers/issue_screen_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.issueController,
  });

  final IssueScreenController issueController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        onChanged: (query) {
          issueController.filterIssue(query);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          label: Text("Search"),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        controller: TextEditingController(
            text: issueController.searchQuery.value),
      ),
    );
  }
}

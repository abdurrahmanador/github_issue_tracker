import 'package:flutter/material.dart';

import '../../controllers/issue_screen_controller.dart';
import '../../utils/constants.dart';

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
      BoxDecoration(borderRadius: BorderRadius.circular(RadiusValues.radius16)),
      child: TextFormField(
        onChanged: (query) {
          issueController.filterIssue(query);//for_query
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          label: Text("Search"),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
        ),
        controller: TextEditingController(
            text: issueController.searchQuery.value),//if_we_move_to_other_page_then_it_will_remember_what_we_left_earlier
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/bindings/app_dependencies.dart';
import 'package:github_issue_tracker/app/bindings/bottom_nav_dependencies.dart';
import 'package:github_issue_tracker/app/ui/pages/home_screen_view.dart';
import 'package:github_issue_tracker/app/ui/pages/issues_screen_view.dart';
import 'package:github_issue_tracker/app/ui/pages/user_profile_view.dart';
import 'package:github_issue_tracker/app/ui/pages/issue_details_view.dart';

class AppRoutes {
  // Define route names as constants
  static const String home = '/';
  static const String issues = '/issues';
  static const String issueDetails = '/issue-details';
  static const String profile = '/profile';

  // Define route pages using GetPage for GetX routing
  static List<GetPage> routes = [
    GetPage(
        name: home,
        page: () => const HomeScreenView(),
        bindings: [AppBindings(), BottomNavBindings()]),
    GetPage(
      name: issues,
      page: () => const IssuesScreenView(),
    ),
    GetPage(
      name: profile,
      page: () => const UserProfileView(),
    ),
    GetPage(
      name: issueDetails,
      page: () => const IssueDetailsView(),
      transition: Transition.rightToLeft,
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/bindings/app_dependencies.dart';
import 'package:github_issue_tracker/app/routes/routes.dart';
import 'package:github_issue_tracker/app/ui/pages/home_screen_view.dart';
import 'package:github_issue_tracker/app/ui/pages/user_profile_view.dart';
import 'package:github_issue_tracker/app/utils/constants.dart';

class GithubIssueTracker extends StatelessWidget {
  const GithubIssueTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Github Issue Tracker",

      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,

      //dark_theme_properties_setup
      darkTheme: ThemeData(
        splashColor: Colors.transparent,   // Removes splash effect globally
        highlightColor: Colors.transparent,  // Removes highlight effect globally
          brightness: Brightness.dark,
        primaryColorDark: AppColors.primaryColor, // Dark primary color
        scaffoldBackgroundColor:AppColors.grey900, // Set background to grey
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.grey850, // App bar color in dark mode
          titleTextStyle: TextStyle(color: AppColors.white), // White app bar text
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color:AppColors.white), // White body text
          bodyText2: TextStyle(color: AppColors.white), // White body text
        ),
      ),


    );
  }
}

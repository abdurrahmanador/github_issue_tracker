import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issue_tracker/app/ui/pages/issues_screen_view.dart';
import 'package:github_issue_tracker/app/ui/pages/user_profile_view.dart';

class BottomNavController extends GetxController{

  RxInt currentIndex=0.obs;


  RxList pages=[
    const IssuesScreenView(),
    const UserProfileView()
  ].obs;


  void changePages(int index){
    currentIndex.value=index;
  }

  Widget get currentPage=>pages[currentIndex.value];

}
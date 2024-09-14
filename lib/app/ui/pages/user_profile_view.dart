import 'package:flutter/material.dart';
import 'package:github_issue_tracker/app/utils/constants.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/img.png"),

                  radius: RadiusValues.radius80,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Francisco Miles",
                style: TextStyle(fontSize: TextSizes.extraLarge),
              ),
              Text(
                "@francisco_miles",
                style: TextStyle(
                  fontSize:  TextSizes.size14,
                  color: Color(0xffC9C9C9),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Bio: There once was...",
                style: TextStyle(fontSize: TextSizes.size17),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Public Repos: 2",
                    style: TextStyle(fontSize: TextSizes.size17),
                  ),
                  Text(
                    "Public Gists: 5",
                    style: TextStyle(fontSize: TextSizes.size17),
                  ),
                  Text(
                    "Private Repos: 5",
                    style: TextStyle(fontSize: TextSizes.size17),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

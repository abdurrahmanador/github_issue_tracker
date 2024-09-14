import 'package:flutter/material.dart';

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

                  radius: 80,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Francisco Miles",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "@francisco_miles",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffC9C9C9),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Bio: There once was...",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Public Repos: 2",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Public Gists: 5",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Private Repos: 5",
                    style: TextStyle(fontSize: 17),
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

import 'package:flutter/material.dart';
import 'package:flutter_app/client/login_as_client_page.dart';
import 'package:flutter_app/freelancer/login_as_freelancer_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool loginAsClient(String username, String password) {
    bool isValidClient = false;

    return isValidClient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Fiverr", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // button for login as client
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginAsClientPage())),
                      child: Text("Login as client")),
                  SizedBox(
                    width: 20,
                  ),
                  // button for login as freelancer
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginAsFreelancerPage())),
                      child: Text("Login as freelancer"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_login_page.dart';
import 'package:flutter_app/freelancer/freelancer_login_page.dart';

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
            const Text("Welcome to Fiverr", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // button for login as client
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginAsClientPage())),
                      child: const Text("Login as client")),
                  const SizedBox(
                    width: 20,
                  ),
                  // button for login as freelancer
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginAsFreelancerPage())),
                      child: const Text("Login as freelancer"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

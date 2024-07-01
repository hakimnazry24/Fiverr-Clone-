import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_login_page.dart';
import 'package:flutter_app/freelancer/freelancer_login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.solid,
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      color: Color.fromRGBO(0, 0, 0, 0.2))
                ],
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "IIUM Freelancer",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "A platform for IIUM students to market their services and to use services provide by others.",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's get started!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginAsClientPage())),
                          child: const Text("Log in as Client")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("or"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginAsFreelancerPage())),
                          child: const Text("Log in as Client")),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

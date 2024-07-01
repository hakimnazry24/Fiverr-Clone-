import 'package:flutter/material.dart';
import "package:flutter_app/firebase/firebase_auth.dart";
import 'package:flutter_app/welcomepage.dart';

class FreelancerDrawer extends StatelessWidget {
  FreelancerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser;
    var userEmail = user?.email as String;

    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 280,
          child: DrawerHeader(
              curve: Curves.easeInOut,
              decoration: const BoxDecoration(color: Colors.green),
              child: SizedBox(
                // width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "IIUM Freelancer",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Logged in as: "),
                    Text(
                      "$userEmail (freelancer)",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const WelcomePage()),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white),
                        child: const Text("Log out"))
                  ],
                ),
              )),
        ),
        const ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile")),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
        const ListTile(
          leading: Icon(Icons.info),
          title: Text("About"),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_profile_page.dart';
import "package:flutter_app/firebase/firebase_auth.dart";
import 'package:flutter_app/welcomepage.dart';

class ClientDrawer extends StatelessWidget {
  const ClientDrawer({super.key});

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
                      '$userEmail (client)',
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
        ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ClientProfilePage())),
            leading: const Icon(
              Icons.person,
            ),
            title: const Text("Profile")),
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

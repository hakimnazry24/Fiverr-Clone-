import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_auth.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage({super.key});

  @override
  State<ClientProfilePage> createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  @override
  Widget build(BuildContext context) {
    var client = auth.currentUser;
    var clientEmail = client?.email as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child:  Icon(
                Icons.account_circle_rounded,
                size: 180,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Email:"),
            Text(clientEmail, style: TextStyle(fontSize: 20,))
          ],
        ),
      ),
    );
  }
}

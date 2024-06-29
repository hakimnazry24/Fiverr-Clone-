import "package:flutter/material.dart";
import "package:flutter_app/client/client_homepage.dart";
import "package:flutter_app/client/create_client_account_page.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_app/firebase/firebase_auth.dart";

class LoginAsClientPage extends StatefulWidget {
  const LoginAsClientPage({super.key});

  @override
  State<LoginAsClientPage> createState() => _LoginAsClientPageState();
}

class _LoginAsClientPageState extends State<LoginAsClientPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential> loginAccount(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration for background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(172, 225, 175, 0.7)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login as Client",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Username"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password")),
              ),
              const SizedBox(
                height: 5,
              ),
              // authentication using Firebase Authentication
              ElevatedButton(
                  onPressed: () async {
                    try {
                      var credential = await loginAccount(
                          usernameController.text, passwordController.text);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const ClientHomePage()));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) => const AlertDialog(
                                content: Text("Wrong password and username"),
                              ));
                    }
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClientHomePage()));
                  },
                  // bypass to Homepage
                  child: const Text("Bypass")),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // redirect to register account to create new account
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateClientAccountPage()));
                      },
                      child: const Text(
                        "Do not have account as a client yet?",
                        style: TextStyle(
                            fontSize: 12, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

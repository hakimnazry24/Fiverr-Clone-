import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_app/firebase/firebase_firestore.dart";
import "package:flutter_app/freelancer/freelancer_create_account_page.dart";
import "package:flutter_app/firebase/firebase_auth.dart";
import "package:flutter_app/freelancer/freelancer_home_page.dart";

class LoginAsFreelancerPage extends StatefulWidget {
  const LoginAsFreelancerPage({super.key});

  @override
  State<LoginAsFreelancerPage> createState() => _LoginAsFreelancerPageState();
}

class _LoginAsFreelancerPageState extends State<LoginAsFreelancerPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  // bool validAccount = false;

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
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background decoration
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
                "Login As Freelancer",
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
              ElevatedButton(
                  // redirect user to home page when authentication is successful
                  onPressed: () async {
                    try {
                      var credential = await loginAccount(
                          usernameController.text, passwordController.text);
                      var user = auth.currentUser;
                      var clientId = user?.uid;
                      db
                          .collection("Freelancer")
                          .doc(clientId)
                          .get()
                          .then((doc) {
                        if (doc.data()?["email"] == user?.email) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const FreelancerHomePage()));
                        }
                      });
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) => const AlertDialog(
                                content: Text("Wrong password and username"),
                              ));
                    }
                  },
                  child: const Text("Login")),
              // bypass to Homepage
              ElevatedButton(
                  onPressed: () {
                    // temporary account used for bypass
                    loginAccount("freelancer@gmail.com", "freelancer123");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FreelancerHomePage()));
                  },
                  child: const Text("Bypass")),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // redirect user to create new account
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateFreelancerAccountPage()));
                      },
                      child: const Text(
                        "Do not have account as a freelancer yet?",
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

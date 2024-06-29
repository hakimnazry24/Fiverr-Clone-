import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_homepage.dart';
import 'package:flutter_app/firebase/firebase_auth.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class CreateClientAccountPage extends StatefulWidget {
  const CreateClientAccountPage({super.key});

  @override
  State<CreateClientAccountPage> createState() =>
      _CreateClientAccountPageState();
}

class _CreateClientAccountPageState extends State<CreateClientAccountPage> {
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool checkPasswordEqualsConfirmPassword(String password1, String password2) {
    bool isEqual = false;
    if (password1 == password2) {
      isEqual = true;
    }

    return isEqual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create client account"),
        backgroundColor: const Color.fromRGBO(172, 225, 175, 0.7),
      ),
      body: ListView(children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(238, 238, 228, 1)),
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(238, 238, 228, 1)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign-Up",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Username"),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "e.g example@gmail.com"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Password"),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Confirm password"),
                        TextField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Confirm password"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool isPasswordEqual =
                                    checkPasswordEqualsConfirmPassword(
                                        passwordController.text,
                                        confirmPasswordController.text);
                                if (isPasswordEqual) {
                                  // create new user using email and password
                                  try {
                                    final credential = await auth
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  } catch (e) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                              content: Text(
                                                  "Invalid email and password. Try again"),
                                            ));
                                  }

                                  // login user using email and password used in registration
                                  try {
                                    await auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);

                                    // get current userId and store it in Client collection
                                    var user = auth.currentUser;
                                    var userId = user?.uid;
                                    var userEmail = user?.email;
                                    db
                                        .collection("Client")
                                        .doc(userId)
                                        .set({"email": userEmail});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Successfully creating new Client account")));

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ClientHomePage()));
                                  } catch (e) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                              content: Text(
                                                  "Wrong username and password"),
                                            ));
                                  }
                                }
                              },
                              child: const Text(
                                "Sign up",
                              ),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

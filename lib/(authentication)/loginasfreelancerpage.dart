import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_app/(authentication)/createclientaccountpage.dart";
import "package:flutter_app/(authentication)/createfreelanceraccountpage.dart";
import "../homepage.dart";

class LoginAsFreelancerPage extends StatefulWidget {
  const LoginAsFreelancerPage({super.key});

  @override
  State<LoginAsFreelancerPage> createState() => _LoginAsFreelancerPageState();
}

class _LoginAsFreelancerPageState extends State<LoginAsFreelancerPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool validAccount = false;

  bool loginAccount(String username, String password) {
    // mock username and password
    String _username = "John";
    String _password = "Doe";

    if (_username == username && _password == password) {
      setState(() {
        validAccount = true;
      });
    } else {
      setState(() {
        validAccount = false;
      });
    }

    return validAccount;
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
                "Login",
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
                  onPressed: () {
                    validAccount = loginAccount(
                        usernameController.text, passwordController.text);
                    if (validAccount) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                content: Text("Wrong username and password"),
                              ));
                    }
                  },
                  child: const Text("Login")),
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
                                    CreateFreelancerAccountPage()));
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

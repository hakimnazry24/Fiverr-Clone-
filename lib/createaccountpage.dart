import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(172, 225, 175, 0.7),
      ),
      body: Container(
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
                            hintText: "Ee.g example@gmail.com"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Phone number"),
                      TextField(
                        controller: phoneNoController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "E.g 01133939962"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Password"),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Password"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
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
    );
  }
}

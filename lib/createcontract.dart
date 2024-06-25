import 'package:flutter/material.dart';
import 'package:flutter_app/service_card.dart';

class CreateContractPage extends StatelessWidget {
  var data;
  CreateContractPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create contract"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),

        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Create contract",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            ServiceCard(
              data: data,
              isForDisplay: true,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Date")
          ],
        ),
      ),
    );
  }
}

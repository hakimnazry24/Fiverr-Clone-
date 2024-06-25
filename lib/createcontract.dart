import 'package:flutter/material.dart';
import 'package:flutter_app/service_card.dart';
import 'package:flutter_app/viewcontractspage.dart';

class CreateContractPage extends StatelessWidget {
  var data;
  CreateContractPage({super.key, required this.data});

  Future<void> createContract() async {}

  @override
  Widget build(BuildContext context) {
    var dateController = TextEditingController();
    var timeController = TextEditingController();
    var offerController = TextEditingController();
    var noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Container(
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
              const SizedBox(
                height: 10,
              ),
              const Text("Date:"),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "e.g: 10-Sep-2023"),
                  controller: dateController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Time:"),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "e.g: 10.00 AM"),
                  controller: timeController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Offer:"),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "e.g: RM10"),
                  controller: offerController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Additional note:"),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  minLines: 3,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "e.g: Please knock before enter"),
                  controller: noteController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await createContract();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ViewContractsPage()));
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content: Text("Something is wrong"),
                                    ));
                          }
                        },
                        child: Text("Create contract"))
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
